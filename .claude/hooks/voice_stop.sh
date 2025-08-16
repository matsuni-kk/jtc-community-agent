#!/usr/bin/env bash
# ========================================
# Claude Code Notification Hook - ランダム音声読み上げ
# ========================================
# 
# 概要: Claude Codeの Notification フックで呼び出され、
#       ランダムに選択した音声でメッセージを読み上げるスクリプト
#
# 依存関係:
#   - VOICEVOX ENGINE (http://127.0.0.1:50021)
#   - jq (JSON解析)
#   - afplay (macOS音声再生)
#   - curl (HTTP通信)
#
# 設定可能項目:
#   - SPEAKER_POOL: 使用する話者IDのリスト
#   - READING_MODE: 読み上げ範囲 (first_line/after_first/full_text/char_limit)
#   - MAX_CHARS: 文字数制限値
#
# 使用方法:
#   - Claude Code の Notification フックとして自動実行
#   - 手動設定変更: bash voice_notification.sh config
#
# ログ出力: /tmp/voice_notification_debug.log
# ========================================

# スクリプト実行設定
set -e                        # エラー発生時に即座に終了
read -r json || json="{}"     # stdin からJSONを読み取り（失敗時はデフォルト値）

# ========================================
# 話者ID設定
# ========================================
# デフォルト話者ID（元のvoicestop.shと同じ）
speaker=47  # ナースロボ＿タイプT（ノーマル）

# ランダム話者選択用プール（オプション機能）
SPEAKER_POOL=(
    3   # ずんだもん（標準）
    7   # ずんだもん（セクシー）
    1   # 四国めたん（あまあま）
    0   # 四国めたん（ノーマル）
    6   # 四国めたん（セクシー）
    2   # 四国めたん（ツンツン）
    8   # 春日部つむぎ（ノーマル）
    20  # 雨晴はう（ノーマル）
    36  # 玄野武宏（ノーマル）
    47  # ナースロボ＿タイプT（ノーマル）
)

# ========================================
# 固定メッセージパターン（手動で追加・編集可能）
# ========================================
# Notification用の固定セリフ集
# ここに新しいセリフを追加すれば自動的にランダム対象になります
NOTIFICATION_MESSAGES=(
    "処理が完了しました"
    "レビューお願いします"
)

# ========================================
# 設定変更コマンド処理（オプション機能）
# ========================================
# 
# 受信JSONに設定変更コマンドが含まれている場合、
# スクリプト自体の設定値を動的に変更する
#
# 対応コマンド:
#   uuid_on/uuid_off: UUID検索モードの切り替え
#   mode_first/mode_after/mode_full/mode_char: 読み上げモード変更
#   show_config: 現在の設定表示
#
# コマンドライン引数での設定変更チェック（スクリプト単体実行時）
if [[ $# -gt 0 ]]; then
    case "$1" in
        "config")
            echo "🎵 ランダム音声読み上げ設定変更"
            echo ""
            echo "📊 現在の設定:"
            echo "話者プール: $(grep -A 10 'SPEAKER_POOL=(' "$0" | grep -o '[0-9]\+' | tr '\n' ', ' | sed 's/,$//')"
            grep -E "^(READING_MODE|MAX_CHARS|MAX_LINES)=" "$0"
            echo ""
            echo "変更したい項目を選択してください:"
            echo "1) 話者プール変更"
            echo "2) メッセージ管理"
            echo "3) 読み上げモード変更"
            echo "4) 行数制限値変更"
            echo "5) 文字数制限値変更"
            echo "6) 設定確認のみ"
            echo "7) 終了"
            read -p "選択 (1-7): " choice
            
            case $choice in
                1)
                    echo "現在の話者設定:"
                    echo "デフォルト話者: ID=$speaker (ナースロボ＿タイプT)"
                    echo ""
                    echo "利用可能な話者プール:"
                    echo "3=ずんだもん標準, 7=ずんだもんセクシー, 1=四国めたんあまあま, 0=四国めたんノーマル"
                    echo "6=四国めたんセクシー, 2=四国めたんツンツン, 8=春日部つむぎ, 20=雨晴はう"
                    echo "36=玄野武宏, 47=ナースロボ"
                    echo ""
                    echo "選択してください:"
                    echo "a) 固定話者のまま (現在: ID=$speaker)"
                    echo "b) ランダム話者に変更"
                    echo "c) 特定の話者IDに固定変更"
                    read -p "選択 (a-c): " speaker_choice
                    case $speaker_choice in
                        a) echo "✅ 固定話者のまま (ID=$speaker)" ;;
                        b) 
                            # ランダム選択に変更
                            new_speaker=${SPEAKER_POOL[$RANDOM % ${#SPEAKER_POOL[@]}]}
                            sed -i '' "s/^speaker=.*/speaker=\${SPEAKER_POOL[\$RANDOM % \${#SPEAKER_POOL[@]}]}/" "$0"
                            echo "✅ ランダム話者モードに変更" 
                            ;;
                        c) 
                            read -p "話者IDを入力 (0-99): " new_id
                            if [[ "$new_id" =~ ^[0-9]+$ ]]; then
                                sed -i '' "s/^speaker=.*/speaker=$new_id/" "$0"
                                echo "✅ 話者ID ${new_id} に固定変更"
                            else
                                echo "❌ 無効な話者ID"
                            fi
                            ;;
                        *) echo "❌ 無効な選択" ;;
                    esac
                    ;;
                2)
                    echo "📢 メッセージ管理:"
                    echo "現在のメッセージ数: $(grep -c '".*"' <<< "$(grep -A 100 'NOTIFICATION_MESSAGES=(' "$0")")"
                    echo ""
                    echo "a) メッセージ一覧表示"
                    echo "b) メッセージ追加"
                    echo "c) メッセージ削除"
                    echo "d) ランダムテスト再生"
                    read -p "選択 (a-d): " msg_choice
                    case $msg_choice in
                        a)
                            echo "📋 登録済みメッセージ一覧:"
                            grep -A 100 'NOTIFICATION_MESSAGES=(' "$0" | grep '".*"' | nl -v1
                            ;;
                        b)
                            read -p "追加するメッセージを入力: " new_msg
                            if [[ -n "$new_msg" ]]; then
                                # 配列の最後に新しいメッセージを追加
                                sed -i '' "/^)/i\\
    \"$new_msg\"" "$0"
                                echo "✅ メッセージ「$new_msg」を追加しました"
                            else
                                echo "❌ 空のメッセージは追加できません"
                            fi
                            ;;
                        c)
                            echo "📋 削除対象メッセージ一覧:"
                            grep -A 100 'NOTIFICATION_MESSAGES=(' "$0" | grep '".*"' | nl -v1
                            read -p "削除する番号を入力: " del_num
                            if [[ "$del_num" =~ ^[0-9]+$ ]]; then
                                # 指定された行番号のメッセージを削除
                                msg_to_delete=$(grep -A 100 'NOTIFICATION_MESSAGES=(' "$0" | grep '".*"' | sed -n "${del_num}p")
                                if [[ -n "$msg_to_delete" ]]; then
                                    escaped_msg=$(echo "$msg_to_delete" | sed 's/[[\.*^$()+?{|]/\\&/g')
                                    sed -i '' "/$escaped_msg/d" "$0"
                                    echo "✅ メッセージを削除しました: $msg_to_delete"
                                else
                                    echo "❌ 無効な番号です"
                                fi
                            else
                                echo "❌ 無効な番号です"
                            fi
                            ;;
                        d)
                            # テスト用ランダムメッセージ選択
                            test_messages=($(grep -A 100 'NOTIFICATION_MESSAGES=(' "$0" | grep '".*"' | sed 's/.*"\(.*\)".*/\1/'))
                            test_msg=${test_messages[$RANDOM % ${#test_messages[@]}]}
                            echo "🎲 テストメッセージ: $test_msg"
                            ;;
                        *)
                            echo "❌ 無効な選択"
                            ;;
                    esac
                    ;;
                3)
                    echo "読み上げモードを選択:"
                    echo "a) first_line: 最初の改行まで"
                    echo "b) line_limit: 指定行数まで"
                    echo "c) after_first: 改行後の内容"
                    echo "d) full_text: 全文読み上げ"
                    echo "e) char_limit: 文字数制限"
                    read -p "選択 (a-e): " mode_choice
                    case $mode_choice in
                        a) sed -i '' 's/^READING_MODE=.*/READING_MODE="first_line"/' "$0"; echo "✅ 最初の改行まで" ;;
                        b) sed -i '' 's/^READING_MODE=.*/READING_MODE="line_limit"/' "$0"; echo "✅ 行数制限" ;;
                        c) sed -i '' 's/^READING_MODE=.*/READING_MODE="after_first"/' "$0"; echo "✅ 改行後の内容" ;;
                        d) sed -i '' 's/^READING_MODE=.*/READING_MODE="full_text"/' "$0"; echo "✅ 全文読み上げ" ;;
                        e) sed -i '' 's/^READING_MODE=.*/READING_MODE="char_limit"/' "$0"; echo "✅ 文字数制限" ;;
                        *) echo "❌ 無効な選択" ;;
                    esac
                    ;;
                4)
                    current_lines=$(grep '^MAX_LINES=' "$0" | cut -d'=' -f2)
                    read -p "行数制限値を入力 (現在: $current_lines): " new_lines
                    if [[ "$new_lines" =~ ^[0-9]+$ ]] && [ "$new_lines" -gt 0 ]; then
                        sed -i '' "s/^MAX_LINES=.*/MAX_LINES=$new_lines/" "$0"
                        echo "✅ 行数制限: ${new_lines}行"
                    else
                        echo "❌ 無効な行数"
                    fi
                    ;;
                5)
                    current_chars=$(grep '^MAX_CHARS=' "$0" | cut -d'=' -f2)
                    read -p "文字数制限値を入力 (現在: $current_chars): " new_chars
                    if [[ "$new_chars" =~ ^[0-9]+$ ]] && [ "$new_chars" -gt 0 ]; then
                        sed -i '' "s/^MAX_CHARS=.*/MAX_CHARS=$new_chars/" "$0"
                        echo "✅ 文字数制限: ${new_chars}文字"
                    else
                        echo "❌ 無効な文字数"
                    fi
                    ;;
                6)
                    echo "📊 詳細設定:"
                    echo "現在の話者: ID=$(grep '^speaker=' "$0" | cut -d'=' -f2)"
                    echo "メッセージ数: $(grep -c '".*"' <<< "$(grep -A 100 'NOTIFICATION_MESSAGES=(' "$0")")"
                    echo "話者プール: $(grep -A 10 'SPEAKER_POOL=(' "$0" | grep -o '[0-9]\+' | tr '\n' ', ' | sed 's/,$//')"
                    grep -E "^(READING_MODE|MAX_CHARS|MAX_LINES)=" "$0"
                    ;;
                7)
                    echo "👋 終了"
                    ;;
                *)
                    echo "❌ 無効な選択"
                    ;;
            esac
            exit 0
            ;;
    esac
fi

config_command=$(echo "$json" | jq -r '.config_command // empty' 2>/dev/null || echo "")
if [[ -n "$config_command" ]]; then
    case "$config_command" in
        "random_speaker") 
            # 話者をランダムに変更（一時的）
            speaker=${SPEAKER_POOL[$RANDOM % ${#SPEAKER_POOL[@]}]}
            echo "🎲 一時的にランダム話者: $speaker" >&2
            ;;
        "mode_first") 
            # 読み上げモード: 最初の改行まで
            sed -i '' 's/^READING_MODE=.*/READING_MODE="first_line"/' "$0"
            echo "✅ 読み上げモード: 最初の改行まで" >&2
            exit 0 ;;
        "mode_after") 
            # 読み上げモード: 改行後の内容のみ
            sed -i '' 's/^READING_MODE=.*/READING_MODE="after_first"/' "$0"
            echo "✅ 読み上げモード: 改行後の内容" >&2
            exit 0 ;;
        "mode_full") 
            # 読み上げモード: 全文読み上げ
            sed -i '' 's/^READING_MODE=.*/READING_MODE="full_text"/' "$0"
            echo "✅ 読み上げモード: 全文読み上げ" >&2
            exit 0 ;;
        "mode_line") 
            # 読み上げモード: 行数制限
            sed -i '' 's/^READING_MODE=.*/READING_MODE="line_limit"/' "$0"
            echo "✅ 読み上げモード: 行数制限" >&2
            exit 0 ;;
        "mode_char") 
            # 読み上げモード: 文字数制限
            sed -i '' 's/^READING_MODE=.*/READING_MODE="char_limit"/' "$0"
            echo "✅ 読み上げモード: 文字数制限" >&2
            exit 0 ;;
        "show_config")
            # 現在の設定を表示
            echo "📊 現在の設定:" >&2
            echo "話者プール: $(grep -A 10 'SPEAKER_POOL=(' "$0" | grep -o '[0-9]\+' | tr '\n' ', ' | sed 's/,$//')" >&2
            grep -E "^(READING_MODE|MAX_CHARS|MAX_LINES)=" "$0" >&2
            exit 0 ;;
    esac
fi

# ========================================
# デバッグログ出力
# ========================================
echo "🔧 voice_notification.sh が呼び出されました $(date)" >> /tmp/voice_notification_debug.log
echo "🔧 選択された話者ID: $speaker" >> /tmp/voice_notification_debug.log
echo "🔧 受信JSON: $json" >> /tmp/voice_notification_debug.log

# ========================================
# ① transcript ファイルの取得・検証
# ========================================
# 
# Claude Code の Stop フックから transcript_path を取得
# 提供されない場合は最新のセッションファイルを自動検索
#

# JSONから transcript_path を抽出
path=$(jq -r '.transcript_path // empty' <<<"$json" 2>/dev/null || echo "")

# transcript_path が提供されない場合は最新ファイルを検索
if [[ -z "$path" ]] || [[ "$path" == "null" ]]; then
    echo "🔧 transcript_pathが提供されないため、最新ファイルを検索します" >> /tmp/voice_notification_debug.log
    # ~/.claude/projects から最新の .jsonl ファイルを検索
    path=$(find ~/.claude/projects -name "*.jsonl" -type f -exec ls -t {} + 2>/dev/null | head -1)
    echo "🔧 検出したファイル: $path" >> /tmp/voice_notification_debug.log
fi

# transcript ファイルの存在確認
if [[ -z "$path" ]] || [[ ! -f "$path" ]]; then
    echo "⚠️ transcript file not found or empty: '$path'" >&2
    echo "🔧 ファイルが見つかりません: $path" >> /tmp/voice_notification_debug.log
    exit 0  # 正常終了（ファイルが見つからない場合もエラーとしない）
fi

# ========================================
# ② 固定メッセージからランダム選択
# ========================================
# 
# transcript内容ではなく、事前定義された固定メッセージから
# ランダムに選択してNotification用音声として使用
#
echo "🔧 固定メッセージからランダム選択モード" >> /tmp/voice_notification_debug.log

# 固定メッセージ配列からランダムに選択
text=${NOTIFICATION_MESSAGES[$RANDOM % ${#NOTIFICATION_MESSAGES[@]}]}

echo "🔧 選択されたメッセージ: $text" >> /tmp/voice_notification_debug.log
echo "🔧 メッセージ長: ${#text}文字" >> /tmp/voice_notification_debug.log

# ========================================
# メッセージ選択結果の検証
# ========================================
if [[ -z "$text" ]]; then
    echo "⚠️ No message selected from NOTIFICATION_MESSAGES" >&2
    exit 0  # 非ブロッキング終了（エラーとして扱わない）
fi

# ========================================
# ③ 読み上げ設定値（ユーザーカスタマイズ可能）
# ========================================
READING_MODE="first_line"  # 読み上げモード（後述の5種類から選択）
MAX_CHARS=300              # 文字数制限モード時の最大文字数（通知用に短く）
MAX_LINES=2                # 行数制限モード時の最大行数（通知用に短く）

# ========================================
# 読み上げモード詳細説明
# ========================================
# first_line:  最初の改行まで（初期値・高速・推奨）
#              - 長い回答の概要のみ読み上げ
#              - 処理速度最優先
#
# line_limit:  指定行数まで読み上げ（NEW!）
#              - MAX_LINES 設定値の行数まで読み上げ
#              - 概要＋詳細の適度なバランス
#
# after_first: 改行後の内容のみ
#              - 概要行をスキップして詳細部分を読み上げ
#              - 説明文の本文のみ聞きたい場合
#
# full_text:   全文読み上げ（改行をスペースに変換）
#              - 完全な内容を全て読み上げ
#              - 時間がかかるが情報は完全
#
# char_limit:  指定文字数で切断
#              - MAX_CHARS 設定値まで読み上げ
#              - 時間制御したい場合

# ========================================
# ④ 固定メッセージの処理（読み上げモード簡略化）
# ========================================
# 
# 固定メッセージは短いため、基本的にそのまま読み上げ
# 必要に応じて文字数制限のみ適用
#
case "$READING_MODE" in
    "char_limit")
        # 指定文字数で切断（cut -c1-N で N文字まで取得）
        text=$(echo "$text" | cut -c1-$MAX_CHARS)
        echo "🔧 読み上げモード: ${MAX_CHARS}文字制限適用" >> /tmp/voice_notification_debug.log
        ;;
    *)
        # その他のモードでは固定メッセージをそのまま使用
        echo "🔧 読み上げモード: 固定メッセージ全文" >> /tmp/voice_notification_debug.log
        ;;
esac

# 処理結果をログに記録
echo "🔧 最終テキスト長: ${#text}文字" >> /tmp/voice_notification_debug.log

# 最終的な読み上げテキストを表示（デバッグ用）
echo "📢 読み上げテキスト（話者ID: $speaker）: $text" >&2

# ========================================
# ⑤ VOICEVOX ENGINE 接続確認
# ========================================
# 
# VOICEVOX ENGINE が起動しているかチェック
# ポート 50021 で /version エンドポイントへの接続を確認
#
if ! curl -s "http://127.0.0.1:50021/version" >/dev/null 2>&1; then
    echo "⚠️ VOICEVOX ENGINE が起動していません (http://127.0.0.1:50021)" >&2
    echo "VOICEVOXアプリを起動してから再実行してください" >&2
    exit 0  # 非ブロッキング終了（サービス未起動は正常ケース）
fi

# ========================================
# ⑥ VOICEVOX ENGINE へ音声クエリ生成
# ========================================
# 
# テキストと話者IDを指定して音声合成用のクエリを生成
# 生成されたクエリJSONは次のステップで音声合成に使用
#
query_json=$(mktemp)  # 一時ファイル作成
if ! curl -s -X POST "http://127.0.0.1:50021/audio_query?speaker=$speaker" \
     --get --data-urlencode "text=$text" -o "$query_json"; then
    echo "⚠️ VOICEVOX ENGINE へのクエリ生成に失敗しました" >&2
    rm -f "$query_json"  # 一時ファイル削除
    exit 0  # 非ブロッキング終了
fi

# ========================================
# ⑦ 音声合成実行
# ========================================
# 
# 生成されたクエリJSONを使用して実際の音声ファイル（WAV形式）を生成
# 合成された音声データは一時ファイルに保存
#
wave_file=$(mktemp).wav  # 音声ファイル用一時ファイル作成
if ! curl -s -H 'Content-Type: application/json' \
     -d @"$query_json" \
     "http://127.0.0.1:50021/synthesis?speaker=$speaker" -o "$wave_file"; then
    echo "⚠️ 音声合成に失敗しました" >&2
    rm -f "$query_json" "$wave_file"  # 一時ファイル削除
    exit 0  # 非ブロッキング終了
fi

# ========================================
# ⑧ 音声ファイル再生
# ========================================
# 
# 生成された音声ファイルをmacOS標準のafplayコマンドで再生
# バックグラウンド実行で非同期再生、一定時間後に一時ファイルを自動削除
#
if command -v afplay >/dev/null 2>&1; then
    echo "🔊 音声を再生中..." >&2
    afplay "$wave_file" &  # バックグラウンドで再生開始
    
    # 10秒後に一時ファイルを削除（バックグラウンドで実行）
    (sleep 10; rm -f "$query_json" "$wave_file") &
else
    # afplayコマンドが見つからない場合（通常はmacOSなら存在する）
    echo "⚠️ afplayコマンドが見つかりません（macOS標準のはずですが...）" >&2
    rm -f "$query_json" "$wave_file"  # 一時ファイル削除
    exit 0  # 非ブロッキング終了
fi

echo "✅ 音声読み上げ完了" >&2 