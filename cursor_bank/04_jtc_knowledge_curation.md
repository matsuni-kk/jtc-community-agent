---
description: JTCCommunityにおけるナレッジ整理・内容分析システム
globs:
alwaysApply: false
---
# ==========================================================
# 04_jtc_knowledge_curation.mdc - ナレッジ整理・内容分析システム
# ==========================================================

path_reference: "jtc_paths.mdc"

# ======== ナレッジ整理システム統合エージェント ========

system_capabilities:
  core_function: "イベントで得た知見の抽出・要約・タグ化・索引作成"
  data_processing: "議事録/メモ/発表資料から重要ポイントとアクションを抽出"
  workflow_management: "FlowドラフトからStockのナレッジベースへ移行可能な形に整形"
  quality_assurance: "事実・決定事項・仮説の区別と引用元の記録"
  integration_support: "イベント整理・レポート作成ルールと相互連携"
  user_experience: "質問で抜け漏れなく知見を構造化できる"

# ======== Phase 1: 抽出・要約フェーズ ========

phase_1_description: |
  取り込みドラフトや運営台帳から、学び・決定事項・TODO・参考資料を抽出します。
  要約レベル（短縮/詳細）を選択し、タグとカテゴリを付与します。
  完了条件は、ナレッジノートのドラフト作成です。

# ======== Phase 2: インデックス化フェーズ ========

phase_2_description: |
  ナレッジの索引（テーマ別/日付別/タグ別）を作成し、重複や欠落を検知します。
  Stockのknowledge配下へ反映する対象を決定します。
  完了条件は、インデックスの更新または新規作成です。

# ======== 統合オプション質問 ========

knowledge_curation_questions:
  - key: "source_refs"
    prompt: "参照元（ドラフト/資料/議事録へのパスや概要）:"
    type: "multiline"
    required: false
    placeholder: "Flow/Public/... や URLなど"
  - key: "highlights"
    prompt: "学び・重要ポイント（箇条書き）:"
    type: "multiline"
    required: true
    placeholder: "学び1, 学び2, ..."
  - key: "decisions"
    prompt: "決定事項:"
    type: "multiline"
    required: false
    placeholder: "次回テーマ, 運営変更点 など"
  - key: "todos"
    prompt: "TODO（担当/期限）:"
    type: "multiline"
    required: false
    placeholder: "資料整理A(8/20), 会場検討B(8/25)"
  - key: "tags"
    prompt: "タグ/カテゴリ（#topic-*, #owner-*）:"
    type: "multiline"
    required: false
    placeholder: "#topic-genai, #owner-xxx"
  - key: "summary_level"
    prompt: "要約レベル（short/long）:"
    type: "text"
    required: false
    placeholder: "short"

# ======== ナレッジ整理プロセス ========

knowledge_curation_steps:
  1_extract_summarize:
    name: "抽出と要約"
    phases:
      - "参照元からハイライト/決定/TODOを抽出"
      - "要約レベルに応じて整形"
      - "タグ・カテゴリ付与"
    quality_standards:
      - "引用元が明示されている"
      - "事実と意見の区別がある"
      - "TODOが実行可能な粒度"

  2_index_update:
    name: "インデックス更新"
    phases:
      - "テーマ/日付/タグ別のインデックス更新"
      - "重複・欠落の検出と解消提案"
      - "Stockへの反映計画"
    integration_points:
      - "Stock/knowledge_baseへの追記"
      - "05 レポート作成への項目連携"

# ======== ナレッジ整理ワークフロー ========

knowledge_curation_workflow:
  phase_1:
    - name: "ナレッジノート作成"
      action: "create_markdown_file"
      description: "Flow/Publicにナレッジノートのドラフトを作成"
      mandatory: true

# ======== テンプレート ========

knowledge_curation_template: |
  # ナレッジノート - {{meta.timestamp}}

  ## 参照元
  {{source_refs}}

  ## ハイライト（学び）
  {{highlights}}

  ## 決定事項
  {{decisions}}

  ## TODO
  {{todos}}

  ## タグ
  {{tags}}

  ---
  **文書情報**
  - 作成日: {{meta.timestamp}}
  - ドメイン: jtc
  - エージェント: JTCCommunity
  - 分類: ナレッジ整理

# ======== エラーハンドリング ========

error_handling:
  no_highlights:
    message: "ハイライトが入力されていません"
    recovery_actions:
      - "最低1項目以上の学びを入力してください"

# ======== 設定 ========

knowledge_curation_settings:
  default_summary_level: "short"

# ======== 統合ポイント ========

integration_points:
  knowledge_index:
    trigger: "インデックス更新"
    action: "create_markdown_file => jtc_paths.mdc: output_knowledge_index"

# ======== 品質保証 ========

quality_assurance:
  mandatory_checks:
    - "引用元の明示"
    - "TODOの実行可能性"
    - "タグの一貫性"

# ======== 成功メトリクス ========

success_metrics:
  - "抽出に要する補足質問 < 5問"
  - "インデックス更新までの時間 < 24h"
  - "重複エントリ率 < 5%"

