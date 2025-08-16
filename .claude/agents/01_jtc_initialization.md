---
name: 01_jtc_initialization
description: JTCCommunityにおけるプロジェクト初期化システム
---

# ==========================================================
# 01_jtc_initialization.mdc - プロジェクト初期化システム
# ==========================================================

path_reference: "jtc_paths.mdc"

# ======== プロジェクト初期化システム統合エージェント ========

system_capabilities:
  core_function: "JTC活動の初期設定（命名、分類、タグ、責任分担）を確立する"
  data_processing: "既存フォルダのスキャンと最低限のカテゴリ構造の生成"
  workflow_management: "Flow/Stock構造の作成と運用ルールの配置"
  quality_assurance: "分類ポリシーと命名規則のチェックリストを提供"
  integration_support: "今後のルール群（02〜05）と整合するパターンを宣言"
  user_experience: "質問ドリブンで迷いなく初期設定を完了できるUIフロー"

# ======== Phase 1: 設計フェーズ ========

phase_1_description: |
  JTCCommunityの情報整理方針（ジャンル、タグ、命名規則）と最小限のStock階層を設計します。
  既存情報の保存場所・発生源（Slack/Connpass/Spreadsheet等）を特定し、収集方針を固めます。
  フォルダとファイルの命名規則、タグ基準、公開/非公開の境界を定義します。

# ======== Phase 2: 構築フェーズ ========

phase_2_description: |
  Flow/Stock/Archivedの基礎ディレクトリを作成し、運用用READMEと分類ポリシーを生成します。
  以降のルールで使用するパターン（draft/output/stock）を確認し、接続関係を確立します。
  完了条件は、Stock配下にイベント/ナレッジの最小構造が存在し、READMEが整備されていることです。

# ======== 統合オプション質問 ========

project_init_questions:
  - key: "community_name"
    prompt: "コミュニティ正式名称（例: JapanTraditionalcompany）:"
    type: "text"
    required: true
    placeholder: "JapanTraditionalcompany"
  - key: "primary_genres"
    prompt: "主要ジャンル（読書会/もくもく会/勉強会/飲み会/その他）:"
    type: "multiline"
    required: true
    placeholder: "もくもく会, 勉強会, 飲み会, 雑談"
  - key: "tag_policy"
    prompt: "タグ付与ポリシー（例: 接頭辞、日付書式、責任者タグ）:"
    type: "multiline"
    required: false
    placeholder: "#event-*, #topic-*, #owner-*"
  - key: "visibility_rules"
    prompt: "公開/非公開の境界ルール（氏名・連絡先・会計情報の扱い）:"
    type: "multiline"
    required: false
    placeholder: "個人情報はFlow/Privateに保存、公開版は匿名化してStockへ"

# ======== プロジェクト初期化プロセス ========

project_initialization_steps:
  1_structure_setup:
    name: "初期構造の作成"
    phases:
      - "Flow/Stock/Archivedディレクトリを作成"
      - "Stock/documents/events と Stock/documents/knowledge を作成"
      - "READMEと分類ポリシーを生成"
    quality_standards:
      - "パスがjtc_paths.mdcと一致している"
      - "READMEに運用ルールが明記されている"
      - "公開/非公開の境界が定義されている"
  
  2_governance_setup:
    name: "運用ガバナンスの定義"
    phases:
      - "命名規則とタグポリシーの確定"
      - "責任分担（編集/承認）の割当（任意）"
      - "変更管理とアーカイブ方針の明文化"
    integration_points:
      - "02 情報取り込みの分類ロジックと整合"
      - "03 イベント整理のイベント種別と整合"
      - "04 ナレッジ整理のタグ・カテゴリと整合"

# ======== プロジェクト初期化ワークフロー ========

project_initialization_workflow:
  phase_1:
    - name: "構造ディレクトリ作成"
      action: "execute_shell"
      description: "Flow/Public, Flow/Private, Stock/documents, events/knowledge配下を作成"
      mandatory: true

# ======== テンプレート ========

project_readme_template: |
  # JTCCommunity 運用ガイド - {{meta.timestamp}}

  ## 概要
  - コミュニティ: {{community_name}}
  - 主ジャンル: {{primary_genres}}

  ## ディレクトリ構造
  - Flow/Public: ドラフトの公開用
  - Flow/Private: 個人・秘匿情報
  - Stock/documents/events: イベント確定版
  - Stock/documents/knowledge: ナレッジ確定版

  ## タグ/命名ポリシー
  {{tag_policy}}

  ## 公開/非公開の境界
  {{visibility_rules}}

  ---
  **文書情報**
  - 作成日: {{meta.timestamp}}
  - ドメイン: jtc
  - エージェント: JTCCommunity
  - 分類: 初期化

# ======== エラーハンドリング ========

error_handling:
  missing_dirs:
    message: "必要ディレクトリの作成に失敗しました"
    recovery_actions:
      - "パス権限を確認してください"
      - "jtc_paths.mdcのrootを見直してください"

# ======== 設定 ========

project_initialization_settings:
  default_visibility: "public"
  date_format: "YYYY-MM-DD"

# ======== 統合ポイント ========

integration_points:
  info_intake:
    trigger: "情報取り込み"
    action: "02_jtc_info_intake.mdc => info_intake_questions"

# ======== 品質保証 ========

quality_assurance:
  mandatory_checks:
    - "README生成"
    - "events/knowledge配下の存在"
    - "Flow/Privateの存在"

# ======== 成功メトリクス ========

success_metrics:
  - "初期化完了までの作業時間 < 10分"
  - "Stock/documents/* が生成されている"
  - "READMEに必要情報が含まれる"

