---
name: agent_planning
description: エージェントプランニング機能 - ドメイン特化エージェントの設計・計画・要件定義
---

# ==========================================================
# agent_planning.md - エージェントプランニング機能
# ==========================================================

path_reference: "agent_template_paths.mdc"

# ======== エージェントプランニングシステム ========
# ドメイン特化エージェントの包括的な設計・計画・要件定義システム
# 業界標準フレームワークに基づく高品質エージェント設計支援

system_description: |
  ドメイン特化エージェントの設計・計画・要件定義を行う統合プランニングシステム。
  業界標準フレームワーク(BABOK、マーケティングBOK等)に基づき、
  実用的で高品質なエージェントの包括的な設計・仕様策定・実装計画を作成。
  TaskリストからKPI設定まで、エージェント開発の全フェーズを支援する。

planning_flow:
  
  phase_1_domain_analysis:
    name: "ドメイン分析"
    domain_analysis_questions:
      - category: "対象ドメイン・業界分析"
        items:
          - "どのドメイン・業界のエージェントを作成しますか？（例：法務、マーケティング、人事、財務等）"
          - "そのドメインで確立されている業界標準フレームワークはありますか？（例：BABOK、PMBOK、ISO等）"
          - "対象ドメインの主要業務プロセスは何ですか？"
          - "そのドメインで一般的に使用されるツールやシステムは？"
      
      - category: "ターゲットユーザー・使用シーン"
        items:
          - "誰がこのエージェントを使用しますか？（役職、経験レベル、技術習熟度）"
          - "どのような業務シーンで使用されますか？（日常業務、プロジェクト、緊急対応等）"
          - "ユーザーの作業環境は？（オフィス、リモート、モバイル等）"
          - "ユーザーが期待する作業時間短縮はどの程度ですか？"
      
      - category: "競合・類似ツール分析"
        items:
          - "現在、そのドメインで使用されている既存ツールはありますか？"
          - "それらツールの課題・不満点は何ですか？"
          - "既存ツールで実現できていない機能は？"
          - "新しいエージェントの差別化ポイントは何ですか？"
      
      - category: "ビジネス要件・制約"
        items:
          - "エージェント導入の目的・ゴールは何ですか？"
          - "予算や時間的な制約はありますか？"
          - "技術的な制約（セキュリティ、プライバシー等）はありますか？"
          - "導入後の運用・保守体制はどうなりますか？"

  phase_2_requirements_definition:
    name: "要件定義"
    requirements_questions:
      - category: "機能要件定義"
        items:
          - "エージェントに最も重要な機能は何ですか？（必須機能）"
          - "追加であると便利な機能は？（推奨機能）"
          - "将来的に実装したい機能は？（将来機能）"
          - "各機能の優先順位はどうなりますか？"
      
      - category: "非機能要件定義"
        items:
          - "応答速度への要求はありますか？（リアルタイム、バッチ処理）"
          - "精度・品質への要求レベルは？（許容エラー率等）"
          - "可用性・信頼性への要求は？（稼働時間、バックアップ等）"
          - "セキュリティ・プライバシーへの要求は？"
      
      - category: "入出力仕様"
        items:
          - "どのような形式のデータを入力しますか？（テキスト、ファイル、API等）"
          - "どのような形式で結果を出力したいですか？（レポート、データ、API等）"
          - "入力データの検証ルールは必要ですか？"
          - "出力データの配信方法は？（メール、ダウンロード、API等）"
      
      - category: "成功基準・KPI設定"
        items:
          - "エージェントの成功をどのように測定しますか？"
          - "定量的な目標はありますか？（処理時間、精度、コスト削減等）"
          - "定性的な改善目標は？（ユーザー満足度、業務品質等）"
          - "導入効果をどのように検証・評価しますか？"

  phase_3_architecture_design:
    name: "アーキテクチャ設計"
    architecture_questions:
      - category: "機能アーキテクチャ設計"
        items:
          - "01-15機能をどのように分割・構成しますか？"
          - "各機能間の連携・依存関係は？"
          - "機能の実装優先順位は？（フェーズ1: 必須、フェーズ2: 拡張、フェーズ3: 最適化）"
          - "機能のグルーピング方針は？（業務フロー別、作業タイプ別等）"
      
      - category: "ワークフロー設計"
        items:
          - "Flowワークフロー（ドラフト→確認→確定）を使用する機能は？"
          - "直接変換（入力→即座に最終結果）を使用する機能は？"
          - "各機能のパスパターン設計は？（draft_xxx、output_xxx、stock_xxx）"
          - "文書管理フローはどうしますか？（Flow/Stock構造の活用方法）"
          - "ルールフォーマット規格（タイトル帯/Phase帯/Questions・Templates区切り）を全ファイルに適用しますか？"
          - "質問スキーマは key/prompt/type(text|multiline)/required で統一しますか？"
          - "命名・参照規則（NN_{domain}_{function}.mdc / call NN_{domain}_{function}.mdc => section）に準拠しますか？"
          - "path_reference と master_triggers（00）を適切に設定しますか？"
      
      - category: "品質・エラーハンドリング設計"
        items:
          - "入力検証はどのレベルで行いますか？"
          - "エラー発生時の対応方針は？（再試行、代替処理、ユーザー通知等）"
          - "品質保証の仕組みは？（自動チェック、人間による確認等）"
          - "ログ・監視の要件は？"
      
      - category: "拡張性・保守性設計"
        items:
          - "将来的な機能追加への対応方針は？"
          - "設定変更・カスタマイズの方針は？"
          - "バージョン管理・更新の方針は？"
          - "ドキュメント・ヘルプの充実度は？"

## Templates

domain_analysis_template: |
  # ドメイン分析レポート
  
  ## ドキュメント情報
  - **作成日**: {{env.NOW:date:YYYY-MM-DD}}
  - **作成者**: Agent Planning System
  - **分析対象**: {{target_domain}}エージェント
  
  ## 1. ドメイン・業界分析
  ### 対象ドメイン
  - **ドメイン名**: {{target_domain}}
  - **業界標準フレームワーク**: {{industry_frameworks}}
  - **主要業務プロセス**: {{main_business_processes}}
  - **使用ツール・システム**: {{common_tools}}
  
  ### ドメイン特性
  ```mermaid
  mindmap
    root(({{target_domain}}))
      業務プロセス
        {{main_business_processes}}
      標準フレームワーク
        {{industry_frameworks}}
      使用ツール
        {{common_tools}}
      課題・ペインポイント
        {{domain_pain_points}}
  ```
  
  ## 2. ターゲットユーザー分析
  ### ユーザーペルソナ
  - **主要ユーザー**: {{target_users}}
  - **使用シーン**: {{usage_scenarios}}
  - **作業環境**: {{work_environment}}
  - **期待効果**: {{expected_benefits}}
  
  ### ユーザージャーニー
  ```mermaid
  journey
    title {{target_domain}}業務ユーザージャーニー
    section 現状
      手動作業: 2: ユーザー
      時間かかる: 1: ユーザー
      ミス発生: 1: ユーザー
    section エージェント導入後
      自動処理: 5: ユーザー
      効率化: 5: ユーザー
      品質向上: 5: ユーザー
  ```
  
  ## 3. 競合・類似ツール分析
  ### 競合分析
  {{#if existing_tools}}
  **既存ツール**: {{existing_tools}}
  {{/if}}
  
  {{#if tool_issues}}
  **課題・不満点**: {{tool_issues}}
  {{/if}}
  
  {{#if missing_features}}
  **実現できていない機能**: {{missing_features}}
  {{/if}}
  
  **差別化ポイント**: {{differentiation_points}}
  
  ## 4. ビジネス要件・制約
  ### プロジェクト要件
  - **目的・ゴール**: {{project_goals}}
  - **予算制約**: {{budget_constraints}}
  - **時間制約**: {{time_constraints}}
  - **技術制約**: {{technical_constraints}}
  - **運用体制**: {{operation_structure}}
  
  ## 5. 分析結果サマリー
  ### 重要なポイント
  1. **ドメインの特徴**: {{domain_characteristics}}
  2. **ユーザーニーズ**: {{user_needs}}
  3. **技術的課題**: {{technical_challenges}}
  4. **ビジネス価値**: {{business_value}}
  
  ### 次ステップ
  - 要件定義フェーズへの移行
  - {{target_domain}}特化機能の詳細設計
  - 実装優先順位の確定
  
  ---
  **ファイル**: domain_analysis_{{target_domain}}_{{env.NOW:date:YYYY-MM-DD}}.md
  **次ステップ**: 要件定義レポートの作成

requirements_definition_template: |
  # 要件定義書
  
  ## ドキュメント情報
  - **作成日**: {{env.NOW:date:YYYY-MM-DD}}
  - **作成者**: Agent Planning System
  - **対象**: {{target_domain}}エージェント
  - **参照**: domain_analysis_{{target_domain}}_{{env.NOW:date:YYYY-MM-DD}}.md
  
  ## 1. 機能要件定義
  ### 機能分類
  ```mermaid
  graph TD
    A[{{target_domain}}エージェント] --> B[必須機能]
    A --> C[推奨機能]
    A --> D[将来機能]
    
    B --> E[{{essential_functions}}]
    C --> F[{{recommended_functions}}]
    D --> G[{{future_functions}}]
    
    style B fill:#ffcccc
    style C fill:#ffffcc
    style D fill:#ccffcc
  ```
  
  ### 機能詳細
  **必須機能（Phase 1）**: {{essential_functions}}
  
  **推奨機能（Phase 2）**: {{recommended_functions}}
  
  **将来機能（Phase 3）**: {{future_functions}}
  
  **機能優先順位**: {{function_priorities}}
  
  ## 2. 非機能要件定義
  ### パフォーマンス要件
  {{#if performance_requirements}}
  - **応答速度**: {{performance_requirements}}
  {{/if}}
  
  {{#if accuracy_requirements}}
  - **精度・品質**: {{accuracy_requirements}}
  {{/if}}
  
  {{#if availability_requirements}}
  - **可用性・信頼性**: {{availability_requirements}}
  {{/if}}
  
  {{#if security_requirements}}
  - **セキュリティ・プライバシー**: {{security_requirements}}
  {{/if}}
  
  ## 3. 入出力仕様
  ### 入力仕様
  ```mermaid
  graph LR
    A[ユーザー入力] --> B{入力タイプ}
    B --> C[テキスト入力]
    B --> D[ファイル入力]
    B --> E[API入力]
    
    C --> F[バリデーション]
    D --> F
    E --> F
    
    F --> G[処理開始]
    
    style A fill:#e1f5fe
    style G fill:#c8e6c9
  ```
  
  **入力形式**: {{input_formats}}
  
  {{#if input_validation}}
  **入力検証**: {{input_validation}}
  {{/if}}
  
  ### 出力仕様
  ```mermaid
  graph LR
    A[処理完了] --> B{出力タイプ}
    B --> C[レポート出力]
    B --> D[データ出力]
    B --> E[API出力]
    
    C --> F[配信・保存]
    D --> F
    E --> F
    
    style A fill:#c8e6c9
    style F fill:#e1f5fe
  ```
  
  **出力形式**: {{output_formats}}
  
  {{#if output_delivery}}
  **配信方法**: {{output_delivery}}
  {{/if}}
  
  ## 4. 成功基準・KPI設定
  ### 定量的目標
  {{#if quantitative_targets}}
  **数値目標**: {{quantitative_targets}}
  {{/if}}
  
  ### 定性的目標
  {{#if qualitative_targets}}
  **品質目標**: {{qualitative_targets}}
  {{/if}}
  
  ### 効果測定方法
  **測定方法**: {{measurement_methods}}
  
  **評価タイミング**: {{evaluation_timing}}
  
  ## 5. 制約・リスク
  ### 制約事項
  {{#if constraints}}
  **制約**: {{constraints}}
  {{/if}}
  
  ### リスク分析
  {{#if risks}}
  **主要リスク**: {{risks}}
  {{/if}}
  
  ### リスク軽減策
  {{#if risk_mitigation}}
  **軽減策**: {{risk_mitigation}}
  {{/if}}
  
  ---
  **ファイル**: requirements_{{target_domain}}_{{env.NOW:date:YYYY-MM-DD}}.md
  **次ステップ**: アーキテクチャ設計書の作成

architecture_design_template: |
  # アーキテクチャ設計書
  
  ## ドキュメント情報
  - **作成日**: {{env.NOW:date:YYYY-MM-DD}}
  - **作成者**: Agent Planning System
  - **対象**: {{target_domain}}エージェント
  - **参照**: requirements_{{target_domain}}_{{env.NOW:date:YYYY-MM-DD}}.md
  
  ## 1. 機能アーキテクチャ設計
  ### 機能分割・構成
  ```mermaid
  graph TD
    A[{{target_domain}}エージェント] --> B[01_core_functions]
    A --> C[02_primary_workflow]
    A --> D[03_management_support]
    A --> E[04-08_domain_functions]
    A --> F[09-12_analysis_functions]
    A --> G[13-15_reporting_functions]
    
    B --> H[{{core_functions_detail}}]
    C --> I[{{primary_workflow_detail}}]
    D --> J[{{management_support_detail}}]
    E --> K[{{domain_functions_detail}}]
    F --> L[{{analysis_functions_detail}}]
    G --> M[{{reporting_functions_detail}}]
    
    style B fill:#ffcccc
    style C fill:#ffcccc
    style D fill:#ffcccc
    style E fill:#ffffcc
    style F fill:#ffffcc
    style G fill:#ccffcc
  ```
  
  ### 機能間連携・依存関係
  **連携設計**: {{function_integration}}
  
  **依存関係**: {{function_dependencies}}
  
  **実装優先順位**: {{implementation_priorities}}
  
  ## 2. ワークフロー設計
  ### Flowワークフロー vs 直接変換
  ```mermaid
  graph TD
    A[ユーザー入力] --> B{処理タイプ}
    B -->|複雑・要確認| C[Flowワークフロー]
    B -->|単純・定型| D[直接変換]
    
    C --> E[ドラフト作成]
    E --> F[ユーザー確認]
    F --> G[修正・編集]
    G --> H[Stock移行]
    
    D --> I[即座に最終結果]
    I --> J[直接保存]
    
    style C fill:#fff3e0
    style D fill:#e8f5e8
    style H fill:#e1f5fe
    style J fill:#e1f5fe
  ```
  
  **Flowワークフロー使用機能**: {{flow_workflow_functions}}
  
  **直接変換使用機能**: {{direct_conversion_functions}}
  
  ### パスパターン設計
  **パスパターン**: {{path_patterns}}
  
  **文書管理フロー**: {{document_management_flow}}
  
  ## 3. 品質・エラーハンドリング設計
  ### 品質保証
  ```mermaid
  graph LR
    A[入力] --> B[入力検証]
    B --> C[処理実行]
    C --> D[出力検証]
    D --> E[品質チェック]
    E --> F[最終出力]
    
    B --> G[エラーハンドリング]
    C --> G
    D --> G
    E --> G
    
    G --> H[エラー対応]
    H --> I[再試行・代替処理]
    
    style B fill:#fff3e0
    style D fill:#fff3e0
    style E fill:#fff3e0
    style G fill:#ffcccc
  ```
  
  **入力検証**: {{input_validation_design}}
  
  **エラー対応**: {{error_handling_design}}
  
  **品質保証**: {{quality_assurance_design}}
  
  **ログ・監視**: {{logging_monitoring_design}}
  
  ## 4. 拡張性・保守性設計
  ### 拡張性設計
  **機能追加**: {{extensibility_design}}
  
  **カスタマイズ**: {{customization_design}}
  
  ### 保守性設計
  **バージョン管理**: {{version_management}}
  
  **ドキュメント**: {{documentation_strategy}}
  
  ## 5. 実装フェーズ計画
  ### Phase 1: MVP（最小実用版）
  **実装範囲**: {{mvp_scope}}
  **期間**: {{mvp_timeline}}
  **成功基準**: {{mvp_success_criteria}}
  
  ### Phase 2: 機能拡張
  **実装範囲**: {{enhancement_scope}}
  **期間**: {{enhancement_timeline}}
  **成功基準**: {{enhancement_success_criteria}}
  
  ### Phase 3: 最適化・運用
  **実装範囲**: {{optimization_scope}}
  **期間**: {{optimization_timeline}}
  **成功基準**: {{optimization_success_criteria}}
  
  ## 6. 技術選択・実装推奨事項
  ### 推奨実装パターン
  **ルール番号体系**: {{rule_numbering_system}}
  
  **ファイル構造**: {{file_structure}}
  
  **命名規則**: {{naming_conventions}}
  
  ### 実装時の注意点
  **主要リスク**: {{implementation_risks}}
  
  **軽減策**: {{risk_mitigation_strategies}}
  
  **品質基準**: {{quality_standards}}
  
  ## 7. 次ステップ・実装準備
  ### 即座実行可能なアクション
  1. **基本構造生成**: enhanced_generate_agent.pyでの骨格作成
  2. **01-15ルール実装**: {{implementation_sequence}}
  3. **マスタールール設定**: 00_master_rules.mdcのトリガー追加
  4. **パスファイル設定**: {{target_domain}}_paths.mdcの設定
  
  ### 実装順序
  **フェーズ1実装**: {{phase1_implementation}}
  **フェーズ2実装**: {{phase2_implementation}}
  **フェーズ3実装**: {{phase3_implementation}}
  
  ---
  **ファイル**: architecture_{{target_domain}}_{{env.NOW:date:YYYY-MM-DD}}.md
  **次ステップ**: エージェント実装の開始

## CLAUDE.md新フォーマット対応トリガー設計

### master_triggers設計例（CLAUDE.md準拠）

```yaml
master_triggers:
  # -----
  # プランニング開始フェーズ (A-01. agent_planning)
  # -----
  - trigger: "(エージェントプランニング|プランニング開始|ドメイン分析|要件定義|agent planning)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**エージェントプランニングを開始します。**\n\nドメイン特化エージェントの包括的な設計・計画を行います。段階的に情報をお聞きしますので、詳細にお答えください。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_planning_questions"
        action: "call agent_planning.md => domain_analysis_questions"
      - name: "create_planning_output"
        action: "create_markdown_file"
        path: "{{patterns.output_planning_report}}"
        template_reference: "agent_planning.md => domain_analysis_template"
      - name: "completion_message"
        action: "message"
        content: "**エージェントプランニングが完了しました。**\n\n保存場所: `{{patterns.output_planning_report}}`\n\n次ステップ: エージェントファイル生成機能で実装ファイルを作成できます。"
  
  # -----
  # 要件定義フェーズ (A-02. requirements_definition)  
  # -----
  - trigger: "(要件定義|機能要件|非機能要件|requirements definition)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**要件定義を開始します。**\n\n機能要件・非機能要件・入出力仕様・KPI設定について詳しくお聞きします。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_requirements_questions"
        action: "call agent_planning.md => requirements_questions"
      - name: "create_requirements_output"
        action: "create_markdown_file"
        path: "{{patterns.output_requirements_definition}}"
        template_reference: "agent_planning.md => requirements_definition_template"
      - name: "completion_message"
        action: "message"
        content: "**要件定義が完了しました。**\n\n保存場所: `{{patterns.output_requirements_definition}}`\n\n要件に基づいてアーキテクチャ設計に進むことができます。"

  # -----
  # アーキテクチャ設計フェーズ (A-03. architecture_design)
  # -----
  - trigger: "(アーキテクチャ設計|機能設計|ワークフロー設計|architecture design)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**アーキテクチャ設計を開始します。**\n\n機能分割・ワークフロー・品質・拡張性について詳細設計を行います。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_architecture_questions"
        action: "call agent_planning.md => architecture_questions"
      - name: "create_architecture_output"
        action: "create_markdown_file"
        path: "{{patterns.output_architecture_design}}"
        template_reference: "agent_planning.md => architecture_design_template"
      - name: "completion_message"
        action: "message"
        content: "**アーキテクチャ設計が完了しました。**\n\n保存場所: `{{patterns.output_architecture_design}}`\n\n設計に基づいてファイル生成機能で実装できます。"
```

validation_rules:
  domain_analysis_validation:
    - criteria: "ドメインの特性が正確に分析されていること"
    - criteria: "ユーザーペルソナが具体的で現実的であること"
    - criteria: "競合分析が包括的で差別化ポイントが明確であること"
    - criteria: "ビジネス要件が測定可能で実現可能であること"

  requirements_validation:
    - criteria: "機能要件が具体的で実装可能であること"
    - criteria: "非機能要件が定量的で検証可能であること"
    - criteria: "入出力仕様が技術的に実現可能であること"
    - criteria: "KPIが測定可能で意味のある指標であること"

  architecture_validation:
    - criteria: "機能分割が論理的で保守性が高いこと"
    - criteria: "ワークフロー設計が実用的で効率的であること"
    - criteria: "品質・エラーハンドリングが包括的であること"
    - criteria: "実装フェーズ計画が現実的で実行可能であること"
