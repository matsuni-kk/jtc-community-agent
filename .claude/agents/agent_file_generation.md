---
name: agent_file_generation
description: エージェントファイル生成機能 - ドメイン特化エージェントの.mdcファイル作成・実装
---

# ==========================================================
# agent_file_generation.md - エージェントファイル生成機能
# ==========================================================

path_reference: "agent_template_paths.mdc"

# ======== エージェントファイル生成システム ========
# プランニング結果に基づく実装可能な.mdcファイルの自動生成システム
# 業界標準準拠の高品質ルールファイル作成支援

system_description: |
  エージェントプランニング結果に基づき、実装可能な.mdcファイルを生成する統合システム。
  00_master_rules.mdc、01-15個別機能ルール、パスファイルを含む
  完全なエージェント実装セットを自動生成。
  業界標準フレームワーク準拠かつ実用的なファイル群を作成する。

generation_flow:
  
  phase_1_structure_generation:
    name: "基本構造生成"
    structure_questions:
      - category: "エージェント基本情報"
        items:
          - "エージェント名は何ですか？（例：LegalAgent、MarketingAgent）"
          - "対象ドメインは何ですか？（例：legal、marketing、hr）"
          - "エージェントの説明を一文で教えてください"
          - "参照するプランニング文書のファイル名は？"
      
      - category: "ディレクトリ構造"
        items:
          - "生成先ディレクトリは？（例：/Users/xxx/output/legal_agent）"
          - "既存ディレクトリを使用しますか？（上書き注意）"
          - "Flowディレクトリ構造をカスタマイズしますか？"
          - "Stockディレクトリ構造をカスタマイズしますか？"
      
      - category: "ルール番号体系"
        items:
          - "01-15のどの番号を使用しますか？（実装予定機能数）"
          - "各番号にどの機能を割り当てますか？"
          - "機能の優先順位は？（フェーズ1: 01-03、フェーズ2: 04-08等）"
          - "将来拡張用の番号を予約しますか？"

  phase_2_master_rules_generation:
    name: "マスタールール生成"
    master_rules_questions:
      - category: "基本設定"
        items:
          - "エージェントのシステム説明文は？"
          - "main_system_capabilitiesは何ですか？（6つ）"
          - "Phase 1の名称と説明は？"
          - "Phase 2の名称と説明は？"
      - category: "フォーマット要件"
        items:
          - "フロントマターに description/globs/alwaysApply: true を含めますか？"
          - "path_reference と ai_instructions を定義しますか？"
          - "タイトル帯（＝＝＝）と master_triggers を定義しますか？"
      
      - category: "トリガー設定"
        items:
          - "各機能のトリガー語彙は？（日本語・英語・同義語）"
          - "トリガーの優先度は？（high、medium、low）"
          - "条件分岐が必要なトリガーはありますか？"
          - "特殊なトリガーパターンはありますか？"
      
      - category: "アクション設定"
        items:
          - "各機能のアクションステップは？（5つ以上推奨）"
          - "start_messageとcompletion_messageの内容は？"
          - "create_markdown_fileのパスパターンは？"
          - "call actionの参照先は？（ファイル名.mdc => セクション名）"
      
      - category: "パスパターン設定"
        items:
          - "draft_xxxパターンはどれを使用しますか？"
          - "output_xxxパターンはどれを使用しますか？"
          - "stock_xxxパターンはどれを使用しますか？"
          - "カスタムパスパターンは必要ですか？"

  phase_3_individual_rules_generation:
    name: "個別ルール生成"
    individual_rules_questions:
      - category: "機能詳細設計"
        items:
          - "各機能のsystem_capabilitiesは？（6つずつ）"
          - "各機能のPhase 1・2の詳細は？"
          - "各機能のプロセスステップは？（2つ以上）"
          - "各機能の品質基準・統合ポイント・自動化機能は？"
      - category: "フォーマット要件"
        items:
          - "フロントマターと path_reference を定義しますか？"
          - "タイトル帯（＝＝＝）と Phase帯（＝＝＝）を記載しますか？"
          - "Questions/ Templates 区切りを設けますか？"
          - "質問スキーマを key/prompt/type(text|multiline)/required で統一しますか？"
          - "命名・参照規則（NN_{domain}_{function}.mdc / call ... => section）に準拠しますか？"
      
      - category: "質問設計"
        items:
          - "各機能の質問カテゴリは？（3-5カテゴリ推奨）"
          - "各カテゴリの具体的質問は？（実業務に即した内容）"
          - "必須質問と任意質問の区分は？"
          - "質問の分岐・条件は必要ですか？"
      
      - category: "テンプレート設計"
        items:
          - "各機能のテンプレート構造は？"
          - "マークダウン構造・セクション分けは？"
          - "Mermaid図表の使用箇所は？"
          - "変数・プレースホルダーの設定は？"
      
      - category: "ワークフロー設計"
        items:
          - "各機能のワークフローステップは？"
          - "アクション・説明・必須フラグの設定は？"
          - "条件分岐・例外処理は必要ですか？"
          - "他機能との連携ポイントは？"

  phase_4_paths_file_generation:
    name: "パスファイル生成"
    paths_questions:
      - category: "基本パス設定"
        items:
          - "base_dir（基準ディレクトリ）は？"
          - "flow_public・flow_private・archivedのパスは？"
          - "docs_root（Stock文書ルート）のパスは？"
          - "programs・projectsの構造は使用しますか？"
      
      - category: "出力パスパターン"
        items:
          - "各機能のdraft_xxxパターンは？"
          - "各機能のoutput_xxxパターンは？"
          - "各機能のstock_xxxパターンは？"
          - "日付・タイムスタンプの使用方針は？"
      
      - category: "特殊パスパターン"
        items:
          - "プログラム・プロジェクト構造のパスは？"
          - "アーカイブファイルのパスは？"
          - "一時ファイル・作業ファイルのパスは？"
          - "外部連携ファイルのパスは？"

## Templates

structure_generation_template: |
  # エージェント構造生成レポート
  
  ## ドキュメント情報
  - **作成日**: {{env.NOW:date:YYYY-MM-DD}}
  - **作成者**: Agent File Generation System
  - **対象**: {{agent_name}}エージェント
  
  ## 1. 生成エージェント概要
  ### 基本情報
  - **エージェント名**: {{agent_name}}
  - **対象ドメイン**: {{target_domain}}
  - **説明**: {{agent_description}}
  - **参照プランニング**: {{planning_reference}}
  
  ### 生成ディレクトリ構造
  ```
  {{agent_name}}/
  ├── Flow/                    # 作業中ドラフト
  │   ├── Public/             # 公開可能な作業ファイル  
  │   └── Private/            # 非公開作業ファイル
  ├── Stock/                   # 確定版ドキュメント
  │   └── documents/          # {{target_domain}}特化文書群
  ├── Archived/                # アーカイブ
  ├── .cursor/                 # Cursor IDE設定
  │   ├── rules/              # 実行用ルール(.mdc)
  │   │   ├── 00_master_rules.mdc
  │   │   ├── 01-15_{{function_names}}.mdc
  │   │   └── {{target_domain}}_paths.mdc
  │   └── templates/          # ドキュメントテンプレート
  ├── cursor_bank/             # 編集用ルールファイル(.md)
  ├── scripts/                 # 自動化スクリプト
  └── README.md                # エージェント専用説明書
  ```
  
  ## 2. ルール番号体系
  ### 実装機能一覧
  {{#each rule_assignments}}
  - **{{number}}**: {{function_name}} - {{description}}
  {{/each}}
  
  ### 実装フェーズ
  **フェーズ1（MVP）**: {{phase1_rules}}
  **フェーズ2（拡張）**: {{phase2_rules}}
  **フェーズ3（最適化）**: {{phase3_rules}}
  
  ## 3. 生成ファイル予定
  ### .mdcファイル一覧
  {{#each generated_files}}
  - **{{filename}}**: {{description}}
    - 機能: {{functionality}}
    - トリガー: {{triggers}}
    - アウトプット: {{outputs}}
  {{/each}}
  
  ---
  **ファイル**: structure_generation_{{agent_name}}_{{env.NOW:date:YYYY-MM-DD}}.md
  **次ステップ**: マスタールール生成の詳細設計

master_rules_template: |
  # マスタールール生成仕様書
  
  ## ドキュメント情報
  - **作成日**: {{env.NOW:date:YYYY-MM-DD}}
  - **作成者**: Agent File Generation System
  - **対象**: {{agent_name}} 00_master_rules.mdc
  
  ## 生成される00_master_rules.mdcファイル
  
  以下の内容で生成されます：
  
  ```yaml
  ---
  description: {{agent_description}}
  globs:
  alwaysApply: true
  ---
  # ==========================================================
  # 00_master_rules.mdc - {{agent_name}}マスタールール
  # ==========================================================
  
  path_reference: "{{domain}}_paths.mdc"
  
  ai_instructions:
    - "定義済みのステップとパスを変更せず正確に実行すること"
    - "execute_shellコマンドを改変しないこと"
    - ".cursor/rules と paths の整合性を保つこと"
    - "失敗時は代替せず、失敗を報告すること"
    - "01-89のルールは本規格（タイトル帯/Phase帯/Questions・Templates区切り、質問スキーマ、命名・参照規則）に準拠すること"
  
  # ======== {{agent_name}}統合エージェント ========
  
  system_capabilities:
    capability_1: "{{capability_1}}"
    capability_2: "{{capability_2}}"
    capability_3: "{{capability_3}}"
    capability_4: "{{capability_4}}"
    capability_5: "{{capability_5}}"
    capability_6: "{{capability_6}}"
  
  # ======== Phase 1: {{phase_1_name}}フェーズ ========
  
  phase_1_description: |
    {{phase_1_description}}
  
  # ======== Phase 2: {{phase_2_name}}フェーズ ========
  
  phase_2_description: |
    {{phase_2_description}}
  
  # ======== マスタートリガー設定 ========
  
  master_triggers:
    {{#each trigger_designs}}
    # -----
    # {{function_name}}フェーズ (A-{{rule_number}}. {{function_key}})
    # -----
    - trigger: "({{triggers}})"
      priority: {{priority}}
      steps:
        - name: "start_message"
          action: "message"
          content: "{{start_message}}"
        - name: "collect_existing_info"
          action: "gather_existing_info"
        - name: "ask_questions"
          action: "call {{file_reference}} => {{section_reference}}"
        - name: "create_output"
          action: "create_markdown_file"
          path: "{{{{patterns.{{path_pattern}}}}}}"
          template_reference: "{{file_reference}} => {{template_reference}}"
        - name: "completion_message"
          action: "message"
          content: "{{completion_message}}"
    {{/each}}
  ```
  
  ## 2. トリガー・アクション設計
  ### Domain Specific Rules (01-89)
  {{#each trigger_designs}}
  #### {{function_name}}
  ```yaml
  - trigger: "({{triggers}})"
    priority: {{priority}}
    steps:
      - name: "start_message"
        action: "message"
        content: "{{start_message}}"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_questions"
        action: "call {{file_reference}} => {{section_reference}}"
      - name: "create_output"
        action: "create_markdown_file"
        path: "{{path_pattern}}"
        template_reference: "{{template_reference}}"
      - name: "completion_message"
        action: "message"
        content: "{{completion_message}}"
  ```
  {{/each}}
  
  ## 3. パスパターン参照
  ### 使用パスパターン
  {{#each path_patterns}}
  - **{{pattern_name}}**: {{pattern_value}}
    - 用途: {{usage}}
    - ファイル形式: {{format}}
  {{/each}}
  
  ---
  **ファイル**: master_rules_spec_{{agent_name}}_{{env.NOW:date:YYYY-MM-DD}}.md
  **次ステップ**: 個別ルール生成の詳細設計

individual_rules_template: |
  # 個別ルール生成仕様書
  
  ## ドキュメント情報
  - **作成日**: {{env.NOW:date:YYYY-MM-DD}}
  - **作成者**: Agent File Generation System
  - **対象**: {{agent_name}} 01-15個別ルール
  
  ## 生成される.mdcファイル例
  
  {{#each individual_rules}}
  ### {{rule_number}}_{{function_name}}.mdc
  
  以下の内容で生成されます：
  
  ```yaml
  ---
  description: {{function_description}}
  globs:
  alwaysApply: false
  ---
  # ==========================================================
  # {{rule_number}}_{{function_name}}.mdc - {{function_name}}システム
  # ==========================================================
  
  path_reference: "{{domain}}_paths.mdc"
  
  # ======== {{function_name}}システム統合エージェント ========
  
  system_capabilities:
    core_function: "{{core_function}}"
    data_processing: "{{data_processing}}"
    workflow_management: "{{workflow_management}}"
    quality_assurance: "{{quality_assurance}}"
    integration_support: "{{integration_support}}"
    user_experience: "{{user_experience}}"
  
  # ======== Phase 1: {{phase_1_name}}フェーズ ========
  
  phase_1_description: |
    {{phase_1_description}}
  
  # ======== Phase 2: {{phase_2_name}}フェーズ ========
  
  phase_2_description: |
    {{phase_2_description}}
  
  # ======== 統合オプション質問 ========
  
  {{function_name}}_questions:
    {{#each question_categories}}
    - key: "{{category_key}}"
      prompt: "{{category_prompt}}"
      type: "{{input_type}}"
      required: {{required_flag}}
      {{#if placeholder}}placeholder: "{{placeholder}}"{{/if}}
    {{/each}}
  
  # ======== {{function_name}}プロセス ========
  
  {{function_name}}_steps:
    1_{{process_1_name}}:
      name: "{{process_1_name}}"
      phases:
        - "{{process_1_step_1}}"
        - "{{process_1_step_2}}"
        - "{{process_1_step_3}}"
      quality_standards:
        - "{{quality_standard_1}}"
        - "{{quality_standard_2}}"
        - "{{quality_standard_3}}"
    
    2_{{process_2_name}}:
      name: "{{process_2_name}}"
      phases:
        - "{{process_2_step_1}}"
        - "{{process_2_step_2}}"
        - "{{process_2_step_3}}"
      integration_points:
        - "{{integration_point_1}}"
        - "{{integration_point_2}}"
        - "{{integration_point_3}}"
  
  # ======== {{function_name}}ワークフロー ========
  
  {{function_name}}_workflow:
    phase_1:
      {{#each workflow_steps}}
      - name: "{{step_name}}"
        action: "{{step_action}}"
        description: "{{step_description}}"
        mandatory: {{mandatory_flag}}
      {{/each}}
  
  # ======== テンプレート ========
  
  {{function_name}}_template: |
    # {{template_title}} - {{{{meta.timestamp}}}}
    
    ## セクション1
    {{{{variable_name}}}}
    
    ---
    **文書情報**
    - 作成日: {{{{meta.timestamp}}}}
    - ドメイン: {{target_domain}}
    - エージェント: {{agent_name}}
    - 分類: {{function_category}}
  
  # ======== エラーハンドリング ========
  
  error_handling:
    {{#each error_types}}
    {{error_type}}:
      message: "{{error_message}}"
      recovery_actions:
        {{#each recovery_actions}}
        - "{{this}}"
        {{/each}}
    {{/each}}
  
  # ======== 設定 ========
  
  {{function_name}}_settings:
    {{#each settings}}
    {{setting_key}}: "{{setting_value}}"
    {{/each}}
  
  # ======== 統合ポイント ========
  
  integration_points:
    {{#each integration_systems}}
    {{system_name}}:
      trigger: "{{trigger_condition}}"
      action: "{{integration_action}}"
    {{/each}}
  
  # ======== 品質保証 ========
  
  quality_assurance:
    mandatory_checks:
      {{#each quality_checks}}
      - "{{this}}"
      {{/each}}
  
  # ======== 成功メトリクス ========
  
  success_metrics:
    {{#each metrics}}
    - "{{metric_definition}}"
    {{/each}}
  ```
  {{/each}}
  
  ---
  **ファイル**: individual_rules_spec_{{agent_name}}_{{env.NOW:date:YYYY-MM-DD}}.md
  **次ステップ**: パスファイル生成の詳細設計

paths_file_template: |
  # パスファイル生成仕様書
  
  ## ドキュメント情報
  - **作成日**: {{env.NOW:date:YYYY-MM-DD}}
  - **作成者**: Agent File Generation System
  - **対象**: {{target_domain}}_paths.mdc
  
  ## 1. 基本パス設定
  ### ファイルヘッダー
  ```yaml
  ---
  description: {{target_domain}}エージェント用パスパターン定義
  alwaysApply: true
  ---
  ```
  
  ### 基本ディレクトリ
  ```yaml
  variables:
    base_dir: "{{base_directory}}"
    flow_public: "{{base_dir}}/Flow/Public"
    flow_private: "{{base_dir}}/Flow/Private"
    archived: "{{base_dir}}/Archived"
    docs_root: "{{base_dir}}/Stock/documents"
    {{#if use_programs_structure}}
    programs_root: "{{docs_root}}/programs"
    projects_root: "{{programs_root}}/{{program_name}}/projects"
    {{/if}}
  ```
  
  ## 2. パスパターン定義
  ### 基本パターン
  ```yaml
  patterns:
    # 基本パターン
    flow_public_date: "{{flow_public}}/{{env.NOW:date:YYYY-MM-DD}}"
    flow_private_date: "{{flow_private}}/{{env.NOW:date:YYYY-MM-DD}}"
    archived_date: "{{archived}}/{{env.NOW:date:YYYY-MM-DD}}"
    
    # Stock確定版パターン
    stock_document: "{{docs_root}}/{{document_name}}.md"
    {{#if use_programs_structure}}
    stock_program_document: "{{projects_root}}/{{project_name}}/documents/{{document_name}}.md"
    {{/if}}
  ```
  
  ### 機能別パスパターン
  ```yaml
    # Flowワークフロー用（ドラフト）
    {{#each draft_patterns}}
    {{pattern_name}}: "{{pattern_value}}"
    {{/each}}
    
    # 直接変換用（即座に使用可能）
    {{#each output_patterns}}
    {{pattern_name}}: "{{pattern_value}}"
    {{/each}}
    
    # Stock確定版用
    {{#each stock_patterns}}
    {{pattern_name}}: "{{pattern_value}}"
    {{/each}}
  ```
  
  ### 特殊パスパターン
  ```yaml
    {{#if special_patterns}}
    # ドメイン特化パターン
    {{#each special_patterns}}
    {{pattern_name}}: "{{pattern_value}}"
    {{/each}}
    {{/if}}
    
    {{#if archive_patterns}}
    # アーカイブパターン
    {{#each archive_patterns}}
    {{pattern_name}}: "{{pattern_value}}"
    {{/each}}
    {{/if}}
  ```
  
  ## 3. パスパターン使用方針
  ### 使い分けルール
  **draft_xxx**: {{draft_usage}}
  **output_xxx**: {{output_usage}}
  **stock_xxx**: {{stock_usage}}
  
  ### ファイル命名規則
  **日付形式**: {{date_format}}
  **プレフィックス**: {{prefix_rules}}
  **サフィックス**: {{suffix_rules}}
  
  ---
  **ファイル**: paths_file_spec_{{target_domain}}_{{env.NOW:date:YYYY-MM-DD}}.md
  **次ステップ**: 実装ファイル群の自動生成

complete_generation_template: |
  # エージェントファイル生成完了レポート
  
  ## ドキュメント情報
  - **作成日**: {{env.NOW:date:YYYY-MM-DD}}
  - **作成者**: Agent File Generation System
  - **対象**: {{agent_name}}エージェント
  
  ## 1. 生成完了ファイル一覧
  ### ディレクトリ構造
  ```
  {{output_directory}}/
  ├── .cursor/rules/
  │   ├── 00_master_rules.mdc          ✅ 生成完了（標準フォーマット準拠）
  │   ├── {{target_domain}}_paths.mdc  ✅ 生成完了
  {{#each generated_rule_files}}
  │   ├── {{filename}}                 ✅ 生成完了（標準フォーマット準拠）
  {{/each}}
  ├── Flow/Public/                     ✅ ディレクトリ作成
  ├── Flow/Private/                    ✅ ディレクトリ作成
  ├── Stock/documents/                 ✅ ディレクトリ作成
  ├── Archived/                        ✅ ディレクトリ作成
  ├── cursor_bank/                     ✅ ディレクトリ作成
  ├── scripts/                         ✅ ディレクトリ作成
  └── README.md                        ✅ 生成完了
  ```
  
  ## 2. 標準フォーマット準拠確認
  
  ### 生成されたファイルのフォーマット準拠状況
  
  #### 00_master_rules.mdc
  - ✅ ヘッダー（description、globs、alwaysApply: true）
  - ✅ system_capabilities（6つの機能定義）
  - ✅ Phase 1/Phase 2構造（phase_description含む）
  - ✅ master_triggers（新フォーマット準拠）
  - ✅ 区切り線統一（# ======== セクション名 ========）
  
  #### 01-15個別ルールファイル
  {{#each generated_rule_files}}
  ##### {{filename}}
  - ✅ ヘッダー（description、globs、alwaysApply: false）
  - ✅ system_capabilities（6つの機能定義）
  - ✅ Phase 1/Phase 2構造
  - ✅ {function_name}_steps（プロセスステップ）
  - ✅ {function_name}_questions（統合オプション質問）
  - ✅ {function_name}_template（標準テンプレート）
  - ✅ エラーハンドリング・設定・統合ポイント・品質保証・成功メトリクス
  {{/each}}
  
  ## 2. 生成ファイル詳細
  ### マスタールール (00_master_rules.mdc)
  - **トリガー数**: {{trigger_count}}個
  - **実装機能**: {{implemented_functions}}
  - **パスパターン参照**: {{path_references}}
  
  ### 個別ルール (01-15)
  {{#each individual_rule_details}}
  #### {{rule_number}}_{{function_name}}.mdc
  - **機能**: {{function_description}}
  - **質問数**: {{question_count}}個
  - **テンプレート**: {{template_type}}
  - **ワークフロー**: {{workflow_type}}
  {{/each}}
  
  ### パスファイル ({{target_domain}}_paths.mdc)
  - **基本パス**: {{basic_paths_count}}個
  - **機能別パス**: {{function_paths_count}}個
  - **特殊パス**: {{special_paths_count}}個
  
  ## 3. 実装品質チェック
  ### 構文チェック
  {{#each syntax_checks}}
  - **{{file_name}}**: {{status}} {{#if errors}}⚠️ {{error_count}}個のエラー{{/if}}
  {{/each}}
  
  ### 機能完全性チェック
  {{#each completeness_checks}}
  - **{{check_name}}**: {{status}}
  {{/each}}
  
  ## 4. 動作テスト結果
  ### トリガーテスト
  {{#each trigger_tests}}
  - **"{{trigger_phrase}}"**: {{test_result}}
  {{/each}}
  
  ### パスパターンテスト
  {{#each path_tests}}
  - **{{pattern_name}}**: {{resolved_path}} {{test_result}}
  {{/each}}
  
  ## 5. 次ステップ・使用方法
  ### 即座実行可能
  1. **Cursor IDEで開く**: {{output_directory}}をCursor IDEで開く
  2. **トリガーテスト**: 実際のトリガー語彙でエージェント動作確認
  3. **カスタマイズ**: 業務に合わせた質問・テンプレートの調整
  
  ### 推奨カスタマイズ
  {{#each customization_recommendations}}
  - **{{area}}**: {{recommendation}}
  {{/each}}
  
  ### 品質向上のため
  {{#each quality_improvements}}
  - **{{area}}**: {{improvement_suggestion}}
  {{/each}}
  
  ## 6. 実装成功基準
  ### 達成済み項目
  {{#each achieved_criteria}}
  - ✅ {{criterion}}
  {{/each}}
  
  ### 要改善項目
  {{#each improvement_needed}}
  - ⚠️ {{criterion}}: {{improvement_action}}
  {{/each}}
  
  ---
  **ファイル**: generation_complete_{{agent_name}}_{{env.NOW:date:YYYY-MM-DD}}.md
  **エージェント**: {{output_directory}} で使用開始可能
  **次ステップ**: 内容確認・フォーマット検証の実施

## CLAUDE.md新フォーマット対応トリガー設計

### master_triggers設計例（CLAUDE.md準拠）

```yaml
master_triggers:
  # -----
  # ファイル生成開始フェーズ (A-01. agent_file_generation)
  # -----
  - trigger: "(ファイル生成|エージェント生成|mdcファイル作成|file generation)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**エージェントファイル生成を開始します。**\n\nプランニング結果に基づき、実装可能な.mdcファイル群を生成します。基本情報をお聞きします。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_generation_questions"
        action: "call agent_file_generation.md => structure_questions"
      - name: "create_generation_output"
        action: "create_markdown_file"
        path: "{{patterns.output_generation_report}}"
        template_reference: "agent_file_generation.md => structure_generation_template"
      - name: "completion_message"
        action: "message"
        content: "**ファイル生成計画が完了しました。**\n\n保存場所: `{{patterns.output_generation_report}}`\n\n次ステップ: 実際のファイル生成実行を開始できます。"

  # -----
  # マスタールール生成フェーズ (A-02. master_rules_generation)
  # -----
  - trigger: "(マスタールール生成|master rules|00_master_rules)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**マスタールール生成を開始します。**\n\n00_master_rules.mdcファイルの詳細設計を行います。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_master_questions"
        action: "call agent_file_generation.md => master_rules_questions"
      - name: "create_master_output"
        action: "create_markdown_file"
        path: "{{patterns.output_master_rules_spec}}"
        template_reference: "agent_file_generation.md => master_rules_template"
      - name: "completion_message"
        action: "message"
        content: "**マスタールール仕様が完成しました。**\n\n保存場所: `{{patterns.output_master_rules_spec}}`\n\n次ステップ: 個別ルール生成に進むことができます。"

  # -----
  # 個別ルール生成フェーズ (A-03. individual_rules_generation)
  # -----
  - trigger: "(個別ルール生成|01-15ルール|individual rules)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**個別ルール生成を開始します。**\n\n01-15の機能別.mdcファイルの詳細設計を行います。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_individual_questions"
        action: "call agent_file_generation.md => individual_rules_questions"
      - name: "create_individual_output"
        action: "create_markdown_file"
        path: "{{patterns.output_individual_rules_spec}}"
        template_reference: "agent_file_generation.md => individual_rules_template"
      - name: "completion_message"
        action: "message"
        content: "**個別ルール仕様が完成しました。**\n\n保存場所: `{{patterns.output_individual_rules_spec}}`\n\n次ステップ: パスファイル生成で完了します。"

  # -----
  # パスファイル生成フェーズ (A-04. paths_file_generation)
  # -----
  - trigger: "(パスファイル生成|paths.mdc|path patterns)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**パスファイル生成を開始します。**\n\n{domain}_paths.mdcファイルの設計を行います。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_paths_questions"
        action: "call agent_file_generation.md => paths_questions"
      - name: "create_paths_output"
        action: "create_markdown_file"
        path: "{{patterns.output_paths_file_spec}}"
        template_reference: "agent_file_generation.md => paths_file_template"
      - name: "completion_message"
        action: "message"
        content: "**パスファイル仕様が完成しました。**\n\n保存場所: `{{patterns.output_paths_file_spec}}`\n\n次ステップ: エージェント検証機能で品質評価を実施できます。"
```

validation_rules:
  structure_validation:
    - criteria: "ディレクトリ構造が正確に作成されていること"
    - criteria: "必要なファイルがすべて生成されていること"
    - criteria: "ファイル権限が適切に設定されていること"

  content_validation:
    - criteria: "YAML構文が正確であること"
    - criteria: "パスパターンが解決可能であること"
    - criteria: "トリガー・アクションが動作可能であること"
    - criteria: "テンプレートが実用的であること"

  functionality_validation:
    - criteria: "各機能が独立して動作すること"
    - criteria: "機能間の連携が正常であること"
    - criteria: "エラーハンドリングが適切であること"
    - criteria: "ユーザビリティが確保されていること"
