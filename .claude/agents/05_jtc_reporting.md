---
name: 05_jtc_reporting
description: JTCCommunityにおけるレポート/ダイジェスト作成システム
---

# ==========================================================
# 05_jtc_reporting.mdc - レポート/ダイジェスト作成システム
# ==========================================================

path_reference: "jtc_paths.mdc"

# ======== レポート作成システム統合エージェント ========

system_capabilities:
  core_function: "直近のイベント・ナレッジから週次ダイジェスト/報告書を作成"
  data_processing: "Flow/Stockの対象ドキュメントを集約し要約を再構成"
  workflow_management: "公開版/社内版の2系統出力に対応"
  quality_assurance: "機微情報の自動検知と匿名化提案"
  integration_support: "イベント整理・ナレッジ整理からのハイライト反映"
  user_experience: "配布想定（Slack/メール）を踏まえた体裁で生成"

# ======== Phase 1: 集約フェーズ ========

phase_1_description: |
  期間・対象範囲を決めて、イベントとナレッジのハイライトを収集します。
  プライバシーに配慮し、公開版と社内版の差分を明確化します。
  完了条件はドラフトの作成です。

# ======== Phase 2: 整形・出力フェーズ ========

phase_2_description: |
  構成（見出し、要約、アクション、次回予告）を整形します。
  渡し先に応じて出力先（Flow/Stock）と命名規則を適用します。
  完了条件は配布可能な完成品の作成です。

# ======== 統合オプション質問 ========

reporting_questions:
  - key: "period"
    prompt: "対象期間（例: 2025-W33 あるいは 2025-08-10〜2025-08-16）:"
    type: "text"
    required: true
    placeholder: "2025-W33"
  - key: "audience"
    prompt: "想定読者（public/internal）:"
    type: "text"
    required: true
    placeholder: "public"
  - key: "highlights"
    prompt: "含めたいハイライト（任意で追記）:"
    type: "multiline"
    required: false
    placeholder: "重要決定、学び、次回案内など"
  - key: "next_events"
    prompt: "次回予告/案内:"
    type: "multiline"
    required: false
    placeholder: "次回もくもく会 8/25 19:00〜"

# ======== レポート作成プロセス ========

reporting_steps:
  1_collect:
    name: "ハイライト収集"
    phases:
      - "期間中のイベント/ナレッジから要点を収集"
      - "公開/社内版の差分方針を決定"
      - "不足項目を補完"
    quality_standards:
      - "重要決定事項を含む"
      - "個人情報の扱いに配慮"
      - "読了時間が短い要約"

  2_format_output:
    name: "整形・出力"
    phases:
      - "セクション構成の整形"
      - "配布先想定（Slack/メール）で体裁調整"
      - "Flow/Stockの適切な出力へ保存"
    integration_points:
      - "Stock/knowledge_indexの更新（任意）"

# ======== レポート作成ワークフロー ========

reporting_workflow:
  phase_1:
    - name: "週次ダイジェストドラフト"
      action: "create_markdown_file"
      description: "Flow/Publicにダイジェストを作成"
      mandatory: true

# ======== テンプレート ========

reporting_template: |
  # 週次ダイジェスト - {{period}} - {{meta.timestamp}}

  ## 1. ハイライト
  {{highlights}}

  ## 2. 決定事項/アクション
  - 決定事項: ...
  - アクション: ...

  ## 3. 学び/ナレッジ
  - ...

  ## 4. 次回予告
  {{next_events}}

  ---
  **文書情報**
  - 作成日: {{meta.timestamp}}
  - ドメイン: jtc
  - エージェント: JTCCommunity
  - 分類: レポート

# ======== エラーハンドリング ========

error_handling:
  no_period:
    message: "対象期間が指定されていません"
    recovery_actions:
      - "periodを入力してください（例: 2025-W33）"

# ======== 設定 ========

reporting_settings:
  default_audience: "public"

# ======== 統合ポイント ========

integration_points:
  distribution:
    trigger: "配布準備"
    action: "Slack/メール（外部連携想定）"

# ======== 品質保証 ========

quality_assurance:
  mandatory_checks:
    - "公開/社内版の差分妥当性"
    - "重要事項の網羅"

# ======== 成功メトリクス ========

success_metrics:
  - "作成所要時間 < 15分"
  - "配布後のフィードバック満足度 > 4/5"

