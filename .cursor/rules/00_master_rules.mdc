---
description: "JTCCommunity Agent Master Rules"
globs:
alwaysApply: true
---
path_reference: "jtc_paths.mdc"

# =========================
# AI注意事項 - AIが確実に守るべき指示
# =========================
ai_instructions:
  - "定義済みのステップとパスを変更せず正確に実行すること"
  - "execute_shellコマンドは改変せず、そのまま実行すること"
  - ".cursor/rules と paths の整合性を保ち、構造を勝手に変えないこと"
  - "失敗時は代替せず、失敗内容を報告しユーザー指示を仰ぐこと"

# ==========================================================
# 00_master_rules.mdc - JTCCommunity マスタールール
# ==========================================================

master_triggers:
  # ========================= / 1–N. Domain Rules (01–89) / =========================

  ## A-01-01. Initialization

  ### プロジェクト初期化
  - trigger: "(JTC初期化|JTCプロジェクト開始|初期設定|プロジェクト初期化)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**JTCプロジェクト初期化を開始します。**\n\n必要な情報を順次お聞きしますので、可能な限り具体的にお答えください。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_questions"
        action: "call 01_jtc_initialization.mdc => project_init_questions"
      - name: "create_structure"
        action: "execute_shell"
        command: "mkdir -p Stock/documents/events Stock/documents/knowledge Flow/Public Flow/Private Archived"
      - name: "create_readme"
        action: "create_markdown_file"
        path: "README.md"
        template_reference: "01_jtc_initialization.mdc => project_readme_template"
      - name: "completion_message"
        action: "message"
        content: "**プロジェクト初期化を完了しました。**\n\n保存場所: `README.md`\n\n【Flowワークフローの場合】\n- ドラフトを確認・編集してください\n- 完成したら「Stock移行」で確定版へ\n\n【直接変換の場合】\n- ファイルは即座に使用可能です"

  ## A-01-02. Info Intake

  ### 情報取り込み
  - trigger: "(情報取り込み|情報インポート|イベント情報|もくもく会情報|勉強会情報)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**情報取り込みを開始します。**\n\nソース/種別/日付/概要などをお伺いします。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_questions"
        action: "call 02_jtc_info_intake.mdc => info_intake_questions"
      - name: "create_output"
        action: "create_markdown_file"
        path: "{{patterns.draft_info_intake}}"
        template_reference: "02_jtc_info_intake.mdc => info_intake_template"
      - name: "completion_message"
        action: "message"
        content: "**情報取り込みドラフトを作成しました。**\n\n保存場所: `{{patterns.draft_info_intake}}`\n\n【Flowワークフローの場合】\n- ドラフトを確認・編集してください\n- 完成したら「Stock移行」で確定版へ\n\n【直接変換の場合】\n- ファイルは即座に使用可能です"

  ## A-01-03. Event Management

  ### イベント整理
  - trigger: "(イベント整理|飲み会整理|出欠管理|イベント運営)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**イベント整理を開始します。**\n\n開催情報・出欠・費用・TODOをお伺いします。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_questions"
        action: "call 03_jtc_event_management.mdc => event_management_questions"
      - name: "create_output"
        action: "create_markdown_file"
        path: "{{patterns.draft_event_plan}}"
        template_reference: "03_jtc_event_management.mdc => event_management_template"
      - name: "completion_message"
        action: "message"
        content: "**イベント運営台帳ドラフトを作成しました。**\n\n保存場所: `{{patterns.draft_event_plan}}`\n\n【Flowワークフローの場合】\n- ドラフトを確認・編集してください\n- 完成したら「Stock移行」で確定版へ\n\n【直接変換の場合】\n- ファイルは即座に使用可能です"

  ## A-01-04. Knowledge Curation

  ### ナレッジ整理
  - trigger: "(ナレッジ整理|内容分析|まとめ|要約作成)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**ナレッジ整理を開始します。**\n\nハイライト・決定事項・TODO・引用元をお伺いします。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_questions"
        action: "call 04_jtc_knowledge_curation.mdc => knowledge_curation_questions"
      - name: "create_output"
        action: "create_markdown_file"
        path: "{{patterns.draft_knowledge_note}}"
        template_reference: "04_jtc_knowledge_curation.mdc => knowledge_curation_template"
      - name: "completion_message"
        action: "message"
        content: "**ナレッジノートのドラフトを作成しました。**\n\n保存場所: `{{patterns.draft_knowledge_note}}`\n\n【Flowワークフローの場合】\n- ドラフトを確認・編集してください\n- 完成したら「Stock移行」で確定版へ\n\n【直接変換の場合】\n- ファイルは即座に使用可能です"

  ## A-01-05. Reporting

  ### 週次ダイジェスト
  - trigger: "(週次ダイジェスト|週報|レポート作成|ダイジェスト)"
    priority: medium
    steps:
      - name: "start_message"
        action: "message"
        content: "**週次ダイジェスト作成を開始します。**\n\n対象期間・想定読者などをお伺いします。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_questions"
        action: "call 05_jtc_reporting.mdc => reporting_questions"
      - name: "create_output"
        action: "create_markdown_file"
        path: "{{patterns.draft_weekly_digest}}"
        template_reference: "05_jtc_reporting.mdc => reporting_template"
      - name: "completion_message"
        action: "message"
        content: "**週次ダイジェストのドラフトを作成しました。**\n\n保存場所: `{{patterns.draft_weekly_digest}}`\n\n【Flowワークフローの場合】\n- ドラフトを確認・編集してください\n- 完成したら「Stock移行」で確定版へ\n\n【直接変換の場合】\n- ファイルは即座に使用可能です"

  # =========================
  # A-01-90. Task Management Rules
  # =========================
  - trigger: "(今日のタスク作成|daily task|task作成)"
    priority: medium
    steps:
      - name: "create_daily_task"
        action: "call 90_task_management.mdc => create_daily_task"

  # =========================
  # A-01-97. Flow to Stock Rules
  # =========================
  - trigger: "(Flow確定|Stock移動|確定版作成)"
    priority: medium
    steps:
      - name: "move_to_stock"
        action: "call 97_flow_to_stock_rules.mdc => flow_to_stock_process"

  # =========================
  # A-01-98. Flow Assist Rules
  # =========================
  - trigger: "(Flow支援|作業支援|draft支援)"
    priority: low
    steps:
      - name: "flow_assist"
        action: "call 98_flow_assist.mdc => provide_flow_assistance"

  # =========================
  # A-01-99. Rule Maintenance
  # =========================
  - trigger: "(ルール更新|rule update|ルールメンテナンス)"
    priority: low
    steps:
      - name: "rule_maintenance"
        action: "call 99_rule_maintenance.mdc => maintain_rules"
