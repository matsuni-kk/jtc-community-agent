---
name: agent_validation
description: エージェント検証機能 - 生成されたエージェントファイルの内容確認・フォーマット検証・品質評価
---

# ==========================================================
# agent_validation.md - エージェント検証機能
# ==========================================================

path_reference: "agent_template_paths.mdc"

# ======== エージェント検証システム ========
# 生成されたエージェントファイルの包括的な検証・評価・品質保証システム
# 記述規則準拠性から実用性まで4つの観点で厳格に評価

system_description: |
  生成されたエージェントファイルの包括的な検証・評価を行う統合システム。
  記述規則準拠性・機能充足性・ゴール適合性・実用性の4観点で厳格に評価。
  構文チェックから実用性評価まで、高品質エージェントの品質保証を実現。
  改善提案とブラッシュアップ計画まで含む完全な品質管理システム。

validation_flow:
  
  phase_1_syntax_compliance:
    name: "記述規則準拠性検証"
    syntax_questions:
      - category: "YAML構文正確性"
        items:
          - "検証対象ディレクトリのパスは？"
          - "どのファイルを検証しますか？（全ファイル・特定ファイル）"
          - "YAML構文エラーの詳細レベルは？（エラーのみ・警告込み）"
          - "自動修正を提案しますか？"
      
      - category: "ルール番号体系準拠"
        items:
          - "ルール番号体系（00-99）への準拠を確認しますか？"
          - "ファイル命名規則への準拠を確認しますか？"
          - "番号の重複・欠番を検出しますか？"
          - "将来拡張への配慮を評価しますか？"
      
      - category: "ファイル構造準拠"
        items:
          - ".cursor/rules/構造への準拠を確認しますか？"
          - "必要ディレクトリの存在を確認しますか？"
          - "ファイル権限の適切性を確認しますか？"
          - "推奨構造との比較を行いますか？"
      
      - category: "パスパターン準拠"
        items:
          - "{{patterns.xxx}}形式の正確性を確認しますか？"
          - "パス参照の整合性を確認しますか？"
          - "未定義パターンの検出を行いますか？"
          - "パス解決テストを実行しますか？"
      
      - category: "ルールフォーマット規格準拠"
        items:
          - "00_masterにフロントマター/path_reference/ai_instructions/タイトル帯/master_triggersが揃っていますか？"
          - "01–89にフロントマター/path_reference/タイトル帯/Phase帯/Questions・Templates区切りがありますか？"
          - "質問は key/prompt/type(text|multiline)/required で統一されていますか？"
          - "命名/参照は NN_{domain}_{function}.mdc / call NN_{domain}_{function}.mdc => section ですか？"

  phase_2_functional_completeness:
    name: "機能充足性検証"
    functional_questions:
      - category: "業界標準準拠度"
        items:
          - "対象ドメインの業界標準フレームワークは？"
          - "フレームワークへの準拠度を評価しますか？"
          - "業界のベストプラクティスとの比較を行いますか？"
          - "専門用語・概念の正確性を確認しますか？"
      
      - category: "ワークフロー網羅度"
        items:
          - "ドメインの主要業務プロセスをリストアップしてください"
          - "各プロセスのカバー状況を評価しますか？"
          - "プロセス間の連携を確認しますか？"
          - "不足している業務プロセスの特定を行いますか？"
      
      - category: "機能間連携"
        items:
          - "各機能の独立性を確認しますか？"
          - "機能間の連携ポイントを評価しますか？"
          - "データフローの一貫性を確認しますか？"
          - "重複機能・矛盾の検出を行いますか？"
      
      - category: "実務適用性"
        items:
          - "質問内容の実務妥当性を評価しますか？"
          - "テンプレート品質を確認しますか？"
          - "アウトプットの即座利用可能性を評価しますか？"
          - "実際の業務シーンでのテストを行いますか？"

  phase_3_goal_alignment:
    name: "ゴール適合性検証"
    goal_questions:
      - category: "初期要件適合"
        items:
          - "元の要件定義書・プランニング文書は？"
          - "初期設定目標との一致度を評価しますか？"
          - "要件の実現度を定量評価しますか？"
          - "要件変更・追加の必要性を評価しますか？"
      
      - category: "ターゲットユーザー適合"
        items:
          - "想定ユーザーペルソナとの適合性を確認しますか？"
          - "ユーザビリティを評価しますか？"
          - "学習コストを評価しますか？"
          - "ユーザー体験の改善点を特定しますか？"
      
      - category: "業務効率化効果"
        items:
          - "作業時間短縮効果を推定しますか？"
          - "品質向上効果を評価しますか？"
          - "コスト削減効果を算出しますか？"
          - "ROI（投資対効果）を評価しますか？"
      
      - category: "成功基準達成度"
        items:
          - "設定されたKPIへの貢献度は？"
          - "成功指標の測定可能性を確認しますか？"
          - "追加すべき成功指標はありますか？"
          - "長期的な効果の持続性を評価しますか？"

  phase_4_practical_utility:
    name: "実用性検証"
    utility_questions:
      - category: "質問品質"
        items:
          - "質問の具体性・明確性を評価しますか？"
          - "回答の収集効率性を評価しますか？"
          - "質問の網羅性を確認しますか？"
          - "質問の改善提案を行いますか？"
      
      - category: "テンプレート品質"
        items:
          - "テンプレートの実用性を評価しますか？"
          - "アウトプットの完成度を確認しますか？"
          - "カスタマイズ容易性を評価しますか？"
          - "テンプレートの改善提案を行いますか？"
      
      - category: "エラーハンドリング"
        items:
          - "エラー対応の包括性を確認しますか？"
          - "ユーザーフレンドリーなエラーメッセージですか？"
          - "復旧手順の明確性を評価しますか？"
          - "エラー予防策の充実度を評価しますか？"
      
      - category: "拡張性・保守性"
        items:
          - "将来の機能追加への対応可能性は？"
          - "設定変更の容易性を評価しますか？"
          - "ドキュメント充実度を確認しますか？"
          - "メンテナンス性を評価しますか？"

## Templates

syntax_compliance_template: |
  # 記述規則準拠性検証レポート
  
  ## ドキュメント情報
  - **作成日**: {{env.NOW:date:YYYY-MM-DD}}
  - **検証者**: Agent Validation System
  - **対象**: {{target_agent}}エージェント
  - **検証範囲**: {{validation_scope}}
  
  ## 1. YAML構文正確性検証 [{{yaml_score}}/5.0]
  ### 検証結果サマリー
  ```mermaid
  pie title YAML構文検証結果
      "正常ファイル" : {{normal_files}}
      "警告あり" : {{warning_files}}
      "エラーあり" : {{error_files}}
  ```
  
  ### 詳細検証結果
  {{#each file_validations}}
  #### {{filename}}
  - **ステータス**: {{status}}
  - **エラー数**: {{error_count}}個
  - **警告数**: {{warning_count}}個
  
  {{#if errors}}
  **エラー詳細**:
  {{#each errors}}
  - Line {{line}}: {{message}}
    ```yaml
    {{code_snippet}}
    ```
    **修正提案**: {{fix_suggestion}}
  {{/each}}
  {{/if}}
  
  {{#if warnings}}
  **警告詳細**:
  {{#each warnings}}
  - Line {{line}}: {{message}}
    **改善提案**: {{improvement_suggestion}}
  {{/each}}
  {{/if}}
  {{/each}}
  
  ## 2. ルール番号体系準拠検証 [{{numbering_score}}/5.0]
  ### 番号体系チェック
  ```mermaid
  gantt
      title ルール番号使用状況
      dateFormat X
      axisFormat %s
      
      section 00-10
      Master Rules     :active, 0, 1
      Domain Rules     :active, 1, 10
      
      section 11-89
      Specialized      :active, 11, 89
      
      section 90-99
      System Rules     :active, 90, 99
  ```
  
  ### 検証項目
  {{#each numbering_checks}}
  - **{{check_name}}**: {{result}} {{#if issues}}⚠️ {{issue_description}}{{/if}}
  {{/each}}
  
  **重複番号**: {{duplicate_numbers}}
  **欠番**: {{missing_numbers}}
  **命名規則違反**: {{naming_violations}}
  
  ## 3. ファイル構造準拠検証 [{{structure_score}}/5.0]
  ### 必須ディレクトリ・ファイル
  ```
  {{target_directory}}/
  {{#each structure_checks}}
  {{path}} {{status_icon}}
  {{/each}}
  ```
  
  ### 構造問題
  {{#if structure_issues}}
  {{#each structure_issues}}
  - **{{issue_type}}**: {{description}}
    - **影響**: {{impact}}
    - **修正方法**: {{fix_method}}
  {{/each}}
  {{else}}
  ✅ 構造に問題なし
  {{/if}}
  
  ## 4. パスパターン準拠検証 [{{path_score}}/5.0]
  ### パスパターン解決テスト
  {{#each path_tests}}
  #### {{pattern_name}}
  - **パターン**: `{{pattern_definition}}`
  - **解決結果**: `{{resolved_path}}`
  - **ステータス**: {{status}}
  {{#if issues}}
  - **問題**: {{issues}}
  - **修正提案**: {{fix_suggestion}}
  {{/if}}
  {{/each}}
  
  ### パスパターン問題
  {{#if path_issues}}
  {{#each path_issues}}
  - **{{pattern_name}}**: {{issue_description}}
    **修正案**: {{fix_suggestion}}
  {{/each}}
  {{else}}
  ✅ パスパターンに問題なし
  {{/if}}
  
  ## 5. 記述規則準拠性総合評価
  **総合スコア**: {{overall_syntax_score}}/5.0
  
  ### 合格/不合格判定
  {{#if syntax_passed}}
  ✅ **合格** - 記述規則に準拠しています
  {{else}}
  ❌ **不合格** - 修正が必要です
  {{/if}}
  
  ### 緊急修正項目
  {{#each critical_fixes}}
  1. **{{item}}**: {{description}}
     - **修正方法**: {{fix_method}}
     - **優先度**: {{priority}}
  {{/each}}
  
  ---
  **ファイル**: syntax_validation_{{target_agent}}_{{env.NOW:date:YYYY-MM-DD}}.md
  **次ステップ**: 機能充足性検証の実施

functional_completeness_template: |
  # 機能充足性検証レポート
  
  ## ドキュメント情報
  - **作成日**: {{env.NOW:date:YYYY-MM-DD}}
  - **検証者**: Agent Validation System
  - **対象**: {{target_agent}}エージェント
  - **ドメイン**: {{target_domain}}
  
  ## 1. 業界標準準拠度検証 [{{standard_score}}/5.0]
  ### 参照フレームワーク
  - **業界標準**: {{industry_framework}}
  - **参照バージョン**: {{framework_version}}
  - **適用範囲**: {{application_scope}}
  
  ### 準拠度分析
  ```mermaid
  radar
      title 業界標準準拠度
      options
          width: 600
          height: 400
      data
          labels: {{framework_areas}}
          datasets:
              label: "実装レベル"
              data: {{implementation_levels}}
              borderColor: "#4ade80"
              backgroundColor: "rgba(74, 222, 128, 0.2)"
  ```
  
  ### 詳細評価
  {{#each framework_assessments}}
  #### {{area_name}}
  - **準拠度**: {{compliance_level}}/5
  - **実装状況**: {{implementation_status}}
  - **不足要素**: {{missing_elements}}
  - **改善提案**: {{improvement_suggestions}}
  {{/each}}
  
  ## 2. ワークフロー網羅度検証 [{{workflow_score}}/5.0]
  ### 主要業務プロセス分析
  ```mermaid
  graph TD
      A[{{domain_name}}業務] --> B[プロセス1]
      A --> C[プロセス2] 
      A --> D[プロセス3]
      A --> E[プロセス4]
      
      B --> F[{{process1_coverage}}]
      C --> G[{{process2_coverage}}]
      D --> H[{{process3_coverage}}]
      E --> I[{{process4_coverage}}]
      
      style F fill:#{{process1_color}}
      style G fill:#{{process2_color}}
      style H fill:#{{process3_color}}
      style I fill:#{{process4_color}}
  ```
  
  ### プロセスカバレッジ
  {{#each process_coverage}}
  #### {{process_name}}
  - **カバー率**: {{coverage_percentage}}%
  - **実装機能**: {{implemented_functions}}
  - **不足機能**: {{missing_functions}}
  - **優先度**: {{priority}}
  {{/each}}
  
  ## 3. 機能間連携検証 [{{integration_score}}/5.0]
  ### 連携マトリックス
  {{#each integration_matrix}}
  | 機能 {{#each functions}}| {{name}} {{/each}}|
  |------|{{#each functions}}--------|{{/each}}
  {{#each functions}}
  | {{name}} {{#each ../functions}}| {{connectivity}} {{/each}}|
  {{/each}}
  {{/each}}
  
  ### 連携問題
  {{#if integration_issues}}
  {{#each integration_issues}}
  - **{{function_pair}}**: {{issue_description}}
    - **影響度**: {{impact_level}}
    - **解決策**: {{solution}}
  {{/each}}
  {{else}}
  ✅ 機能間連携に問題なし
  {{/if}}
  
  ## 4. 実務適用性検証 [{{practical_score}}/5.0]
  ### 質問・テンプレート品質
  {{#each quality_assessments}}
  #### {{function_name}}
  - **質問品質**: {{question_quality}}/5
    - 具体性: {{question_specificity}}
    - 網羅性: {{question_completeness}}
    - 実用性: {{question_practicality}}
  
  - **テンプレート品質**: {{template_quality}}/5
    - 完成度: {{template_completeness}}
    - カスタマイズ性: {{template_customizability}}
    - 実用性: {{template_practicality}}
  {{/each}}
  
  ## 5. 機能充足性総合評価
  **総合スコア**: {{overall_functional_score}}/5.0
  
  ### 合格/不合格判定
  {{#if functional_passed}}
  ✅ **合格** - 機能要件を満たしています
  {{else}}
  ❌ **不合格** - 機能強化が必要です
  {{/if}}
  
  ### 重要改善項目
  {{#each major_improvements}}
  1. **{{area}}**: {{description}}
     - **実装方法**: {{implementation_method}}
     - **期待効果**: {{expected_benefit}}
  {{/each}}
  
  ---
  **ファイル**: functional_validation_{{target_agent}}_{{env.NOW:date:YYYY-MM-DD}}.md
  **次ステップ**: ゴール適合性検証の実施

goal_alignment_template: |
  # ゴール適合性検証レポート
  
  ## ドキュメント情報
  - **作成日**: {{env.NOW:date:YYYY-MM-DD}}
  - **検証者**: Agent Validation System
  - **対象**: {{target_agent}}エージェント
  - **参照要件**: {{requirement_reference}}
  
  ## 1. 初期要件適合検証 [{{requirement_score}}/5.0]
  ### 要件実現度マトリックス
  | 要件カテゴリ | 実現度 | 詳細 |
  |------------|-------|------|
  {{#each requirement_fulfillment}}
  | {{category}} | {{fulfillment_rate}}% | {{details}} |
  {{/each}}
  
  ### 要件ギャップ分析
  ```mermaid
  graph LR
      A[初期要件] --> B{実現度}
      B -->|100%| C[完全実現]
      B -->|80-99%| D[概ね実現]
      B -->|60-79%| E[部分実現]
      B -->|<60%| F[要改善]
      
      C --> G[{{fully_met_count}}項目]
      D --> H[{{mostly_met_count}}項目]
      E --> I[{{partially_met_count}}項目]
      F --> J[{{need_improvement_count}}項目]
      
      style C fill:#c8e6c9
      style D fill:#fff3e0
      style E fill:#ffffcc
      style F fill:#ffcccc
  ```
  
  ### 未実現要件
  {{#if unmet_requirements}}
  {{#each unmet_requirements}}
  - **{{requirement}}**: {{gap_description}}
    - **影響度**: {{impact_level}}
    - **実装案**: {{implementation_suggestion}}
  {{/each}}
  {{else}}
  ✅ すべての要件が実現されています
  {{/if}}
  
  ## 2. ターゲットユーザー適合検証 [{{user_score}}/5.0]
  ### ユーザーペルソナ適合分析
  ```mermaid
  mindmap
    root((ユーザー適合性))
      使いやすさ
        操作の直感性: {{usability_intuitiveness}}
        学習コストの低さ: {{learning_cost}}
        エラー回避: {{error_prevention}}
      効率性
        作業時間短縮: {{time_saving}}
        自動化度: {{automation_level}}
        並行作業対応: {{parallel_work}}
      満足度
        期待値との合致: {{expectation_match}}
        アウトプット品質: {{output_quality}}
        カスタマイズ性: {{customizability}}
  ```
  
  ### ユーザビリティ課題
  {{#if usability_issues}}
  {{#each usability_issues}}
  - **{{issue_area}}**: {{description}}
    - **対象ユーザー**: {{affected_users}}
    - **改善策**: {{improvement_action}}
  {{/each}}
  {{else}}
  ✅ ユーザビリティに問題なし
  {{/if}}
  
  ## 3. 業務効率化効果検証 [{{efficiency_score}}/5.0]
  ### 効率化インパクト試算
  ```mermaid
  graph TD
      A[現状業務] --> B[エージェント導入後]
      
      A --> A1[作業時間: {{current_time}}]
      A --> A2[エラー率: {{current_error_rate}}]
      A --> A3[品質レベル: {{current_quality}}]
      
      B --> B1[作業時間: {{improved_time}}]
      B --> B2[エラー率: {{improved_error_rate}}]
      B --> B3[品質レベル: {{improved_quality}}]
      
      A1 -.->|{{time_reduction}}削減| B1
      A2 -.->|{{error_reduction}}改善| B2
      A3 -.->|{{quality_improvement}}向上| B3
      
      style A1 fill:#ffcccc
      style A2 fill:#ffcccc
      style A3 fill:#ffffcc
      style B1 fill:#c8e6c9
      style B2 fill:#c8e6c9
      style B3 fill:#c8e6c9
  ```
  
  ### ROI分析
  **投資対効果**: {{roi_calculation}}
  - **導入コスト**: {{implementation_cost}}
  - **年間削減効果**: {{annual_savings}}
  - **回収期間**: {{payback_period}}
  
  ## 4. 成功基準達成度検証 [{{success_score}}/5.0]
  ### KPI達成予測
  {{#each kpi_assessments}}
  #### {{kpi_name}}
  - **目標値**: {{target_value}}
  - **予想達成値**: {{predicted_value}}
  - **達成率**: {{achievement_rate}}%
  - **信頼度**: {{confidence_level}}
  {{/each}}
  
  ### 成功確率分析
  ```mermaid
  pie title 成功基準達成予測
      "高確率達成" : {{high_confidence}}
      "達成可能" : {{medium_confidence}}
      "要改善" : {{low_confidence}}
  ```
  
  ## 5. ゴール適合性総合評価
  **総合スコア**: {{overall_goal_score}}/5.0
  
  ### 合格/不合格判定
  {{#if goal_passed}}
  ✅ **合格** - 設定ゴールに適合しています
  {{else}}
  ❌ **不合格** - ゴール再定義が必要です
  {{/if}}
  
  ### 戦略的改善提案
  {{#each strategic_improvements}}
  1. **{{strategic_area}}**: {{proposal}}
     - **実装アプローチ**: {{approach}}
     - **期待ROI**: {{expected_roi}}
  {{/each}}
  
  ---
  **ファイル**: goal_validation_{{target_agent}}_{{env.NOW:date:YYYY-MM-DD}}.md
  **次ステップ**: 実用性検証の実施

practical_utility_template: |
  # 実用性検証レポート
  
  ## ドキュメント情報
  - **作成日**: {{env.NOW:date:YYYY-MM-DD}}
  - **検証者**: Agent Validation System
  - **対象**: {{target_agent}}エージェント
  - **検証項目**: 質問品質・テンプレート品質・エラーハンドリング・拡張性
  
  ## 1. 質問品質検証 [{{question_score}}/5.0]
  ### 質問設計分析
  ```mermaid
  graph TD
      A[質問品質] --> B[具体性]
      A --> C[明確性]
      A --> D[網羅性]
      A --> E[効率性]
      
      B --> B1[{{specificity_score}}/5]
      C --> C1[{{clarity_score}}/5]
      D --> D1[{{completeness_score}}/5]
      E --> E1[{{efficiency_score}}/5]
      
      style B1 fill:#{{specificity_color}}
      style C1 fill:#{{clarity_color}}
      style D1 fill:#{{completeness_color}}
      style E1 fill:#{{efficiency_color}}
  ```
  
  ### 機能別質問品質
  {{#each question_assessments}}
  #### {{function_name}}
  - **質問数**: {{question_count}}個
  - **品質スコア**: {{quality_score}}/5
  
  **優秀な質問例**:
  {{#each good_questions}}
  - "{{question}}" ✅ {{reason}}
  {{/each}}
  
  **改善が必要な質問**:
  {{#each poor_questions}}
  - "{{question}}" ⚠️ {{issue}}
    **改善案**: "{{improvement}}"
  {{/each}}
  {{/each}}
  
  ## 2. テンプレート品質検証 [{{template_score}}/5.0]
  ### テンプレート評価基準
  | 機能 | 完成度 | カスタマイズ性 | 実用性 | 総合 |
  |------|-------|-------------|-------|------|
  {{#each template_assessments}}
  | {{function_name}} | {{completeness}}/5 | {{customizability}}/5 | {{practicality}}/5 | {{overall}}/5 |
  {{/each}}
  
  ### アウトプット品質分析
  ```mermaid
  radar
      title テンプレート品質レーダー
      options
          scale: [0, 5]
      data
          labels: ["完成度", "読みやすさ", "構造性", "カスタマイズ性", "実用性", "専門性"]
          datasets:
              label: "実装レベル"
              data: {{template_radar_data}}
              borderColor: "#3b82f6"
              backgroundColor: "rgba(59, 130, 246, 0.2)"
  ```
  
  ### テンプレート改善提案
  {{#each template_improvements}}
  #### {{function_name}}
  **現状の問題**:
  {{#each issues}}
  - {{issue_description}}
  {{/each}}
  
  **改善提案**:
  {{#each suggestions}}
  - {{improvement_suggestion}}
    **実装方法**: {{implementation_method}}
  {{/each}}
  {{/each}}
  
  ## 3. エラーハンドリング検証 [{{error_score}}/5.0]
  ### エラー対応カバレッジ
  ```mermaid
  graph LR
      A[入力エラー] --> A1[{{input_error_coverage}}%]
      B[処理エラー] --> B1[{{processing_error_coverage}}%]
      C[出力エラー] --> C1[{{output_error_coverage}}%]
      D[システムエラー] --> D1[{{system_error_coverage}}%]
      
      A1 --> E[復旧手順]
      B1 --> E
      C1 --> E
      D1 --> E
      
      style A1 fill:#{{input_error_color}}
      style B1 fill:#{{processing_error_color}}
      style C1 fill:#{{output_error_color}}
      style D1 fill:#{{system_error_color}}
  ```
  
  ### エラーハンドリング詳細
  {{#each error_handling_details}}
  #### {{error_category}}
  - **検出レベル**: {{detection_level}}
  - **エラーメッセージ**: {{error_message_quality}}
  - **復旧手順**: {{recovery_procedure_quality}}
  - **ユーザビリティ**: {{user_friendliness}}
  
  **改善点**:
  {{#each improvement_areas}}
  - {{improvement_description}}
  {{/each}}
  {{/each}}
  
  ## 4. 拡張性・保守性検証 [{{extensibility_score}}/5.0]
  ### 拡張性マトリックス
  | 拡張領域 | 容易性 | 影響範囲 | 実装コスト | 評価 |
  |----------|-------|----------|-----------|------|
  {{#each extensibility_matrix}}
  | {{area}} | {{ease_level}} | {{impact_scope}} | {{implementation_cost}} | {{rating}}/5 |
  {{/each}}
  
  ### 将来対応設計
  ```mermaid
  graph TD
      A[現在の実装] --> B[機能追加]
      A --> C[設定変更]
      A --> D[ドメイン拡張]
      A --> E[インテグレーション]
      
      B --> B1[{{feature_addition_score}}/5]
      C --> C1[{{configuration_score}}/5]
      D --> D1[{{domain_expansion_score}}/5]
      E --> E1[{{integration_score}}/5]
      
      style B1 fill:#{{feature_color}}
      style C1 fill:#{{config_color}}
      style D1 fill:#{{domain_color}}
      style E1 fill:#{{integration_color}}
  ```
  
  ### 保守性評価
  {{#each maintainability_assessments}}
  - **{{aspect}}**: {{rating}}/5
    **詳細**: {{details}}
    **改善案**: {{improvement_suggestion}}
  {{/each}}
  
  ## 5. 実用性総合評価
  **総合スコア**: {{overall_utility_score}}/5.0
  
  ### 合格/不合格判定
  {{#if utility_passed}}
  ✅ **合格** - 実用レベルに達しています
  {{else}}
  ❌ **不合格** - 実用化には改善が必要です
  {{/if}}
  
  ### 実用化のための重要改善項目
  {{#each critical_improvements}}
  1. **{{improvement_area}}**: {{description}}
     - **優先度**: {{priority}}
     - **実装工数**: {{effort_estimate}}
     - **効果**: {{expected_impact}}
  {{/each}}
  
  ---
  **ファイル**: utility_validation_{{target_agent}}_{{env.NOW:date:YYYY-MM-DD}}.md
  **次ステップ**: 総合評価レポートの作成

comprehensive_validation_template: |
  # エージェント品質評価総合レポート
  
  ## ドキュメント情報
  - **作成日**: {{env.NOW:date:YYYY-MM-DD}}
  - **評価者**: Agent Validation System
  - **対象**: {{target_agent}}エージェント
  - **評価基準**: 4観点包括評価（記述規則準拠性・機能充足性・ゴール適合性・実用性）
  
  ## 1. 評価サマリー
  ### 4観点評価結果
  ```mermaid
  radar
      title エージェント品質評価
      options
          scale: [0, 5]
      data
          labels: ["記述規則準拠性", "機能充足性", "ゴール適合性", "実用性"]
          datasets:
              label: "評価スコア"
              data: [{{syntax_score}}, {{functional_score}}, {{goal_score}}, {{utility_score}}]
              borderColor: "#f59e0b"
              backgroundColor: "rgba(245, 158, 11, 0.2)"
              borderWidth: 3
              
              label: "合格基準"
              data: [4.0, 4.0, 4.0, 4.0]
              borderColor: "#10b981"
              backgroundColor: "rgba(16, 185, 129, 0.1)"
              borderDash: [5, 5]
  ```
  
  ### 総合判定
  ```mermaid
  graph TD
      A[エージェント評価] --> B{総合スコア}
      B -->|4.0以上| C[合格]
      B -->|3.5-3.9| D[条件付き合格]
      B -->|3.5未満| E[不合格]
      
      B --> F[{{overall_score}}/5.0]
      
      {{#if passed}}
      F --> C
      style C fill:#c8e6c9
      {{else if conditional}}
      F --> D
      style D fill:#fff3e0
      {{else}}
      F --> E
      style E fill:#ffcccc
      {{/if}}
  ```
  
  **総合スコア**: {{overall_score}}/5.0
  **判定結果**: {{final_judgment}}
  
  ## 2. 観点別詳細評価
  ### 2.1 記述規則準拠性 [{{syntax_score}}/5.0]
  ```mermaid
  graph LR
      A[記述規則準拠性] --> B[YAML構文: {{yaml_syntax_score}}]
      A --> C[ルール番号体系: {{rule_numbering_score}}]
      A --> D[ファイル構造: {{file_structure_score}}]
      A --> E[パスパターン: {{path_pattern_score}}]
      
      style B fill:#{{yaml_color}}
      style C fill:#{{numbering_color}}
      style D fill:#{{structure_color}}
      style E fill:#{{path_color}}
  ```
  
  **評価結果**: {{syntax_evaluation}}
  
  **主要問題点**:
  {{#each syntax_issues}}
  - {{issue_description}} (優先度: {{priority}})
  {{/each}}
  
  ### 2.2 機能充足性 [{{functional_score}}/5.0]
  ```mermaid
  graph LR
      A[機能充足性] --> B[業界標準準拠: {{standard_compliance_score}}]
      A --> C[ワークフロー網羅: {{workflow_coverage_score}}]
      A --> D[機能間連携: {{function_integration_score}}]
      A --> E[実務適用性: {{practical_application_score}}]
      
      style B fill:#{{standard_color}}
      style C fill:#{{workflow_color}}
      style D fill:#{{integration_color}}
      style E fill:#{{application_color}}
  ```
  
  **評価結果**: {{functional_evaluation}}
  
  **主要問題点**:
  {{#each functional_issues}}
  - {{issue_description}} (優先度: {{priority}})
  {{/each}}
  
  ### 2.3 ゴール適合性 [{{goal_score}}/5.0]
  ```mermaid
  graph LR
      A[ゴール適合性] --> B[初期要件適合: {{requirement_match_score}}]
      A --> C[ユーザー適合: {{user_fit_score}}]
      A --> D[効率化効果: {{efficiency_effect_score}}]
      A --> E[成功基準達成: {{success_criteria_score}}]
      
      style B fill:#{{requirement_color}}
      style C fill:#{{user_color}}
      style D fill:#{{efficiency_color}}
      style E fill:#{{success_color}}
  ```
  
  **評価結果**: {{goal_evaluation}}
  
  **主要問題点**:
  {{#each goal_issues}}
  - {{issue_description}} (優先度: {{priority}})
  {{/each}}
  
  ### 2.4 実用性 [{{utility_score}}/5.0]
  ```mermaid
  graph LR
      A[実用性] --> B[質問品質: {{question_quality_score}}]
      A --> C[テンプレート品質: {{template_quality_score}}]
      A --> D[エラーハンドリング: {{error_handling_score}}]
      A --> E[拡張性: {{extensibility_score}}]
      
      style B fill:#{{question_color}}
      style C fill:#{{template_color}}
      style D fill:#{{error_color}}
      style E fill:#{{extension_color}}
  ```
  
  **評価結果**: {{utility_evaluation}}
  
  **主要問題点**:
  {{#each utility_issues}}
  - {{issue_description}} (優先度: {{priority}})
  {{/each}}
  
  ## 3. 総合改善計画
  ### 3.1 致命的問題（即座修正必要）
  {{#if critical_issues}}
  {{#each critical_issues}}
  #### {{issue_title}}
  - **問題**: {{problem_description}}
  - **影響**: {{impact_description}}
  - **修正方法**: {{fix_method}}
  - **工数見積**: {{effort_estimate}}
  {{/each}}
  {{else}}
  ✅ 致命的問題なし
  {{/if}}
  
  ### 3.2 重要問題（優先的修正推奨）
  {{#if major_issues}}
  {{#each major_issues}}
  #### {{issue_title}}
  - **問題**: {{problem_description}}
  - **改善効果**: {{improvement_effect}}
  - **実装方法**: {{implementation_method}}
  - **工数見積**: {{effort_estimate}}
  {{/each}}
  {{else}}
  ✅ 重要問題なし
  {{/if}}
  
  ### 3.3 改善提案（品質向上のため）
  {{#each improvement_suggestions}}
  #### {{suggestion_title}}
  - **提案内容**: {{suggestion_description}}
  - **期待効果**: {{expected_benefit}}
  - **実装難易度**: {{implementation_difficulty}}
  - **優先度**: {{priority_level}}
  {{/each}}
  
  ## 4. ブラッシュアップ計画
  ### 4.1 ブラッシュアップ要否判定
  ```mermaid
  graph TD
      A[評価結果分析] --> B{判定基準}
      B -->|全観点4.0以上| C[ブラッシュアップ不要]
      B -->|致命的問題あり| D[必須ブラッシュアップ]
      B -->|重要問題あり| E[推奨ブラッシュアップ]
      
      {{#if no_brushup_needed}}
      A --> C
      style C fill:#c8e6c9
      {{else if mandatory_brushup}}
      A --> D
      style D fill:#ffcccc
      {{else}}
      A --> E
      style E fill:#fff3e0
      {{/if}}
  ```
  
  **判定結果**: {{brushup_decision}}
  **理由**: {{brushup_reason}}
  
  ### 4.2 実装フェーズ計画
  {{#if brushup_needed}}
  #### フェーズ1: 緊急修正（{{phase1_duration}}）
  {{#each phase1_tasks}}
  - **{{task_name}}**: {{task_description}}
    - 担当: {{assignee}}
    - 完了基準: {{completion_criteria}}
  {{/each}}
  
  #### フェーズ2: 重要改善（{{phase2_duration}}）
  {{#each phase2_tasks}}
  - **{{task_name}}**: {{task_description}}
    - 担当: {{assignee}}
    - 完了基準: {{completion_criteria}}
  {{/each}}
  
  #### フェーズ3: 品質向上（{{phase3_duration}}）
  {{#each phase3_tasks}}
  - **{{task_name}}**: {{task_description}}
    - 担当: {{assignee}}
    - 完了基準: {{completion_criteria}}
  {{/each}}
  {{else}}
  ✅ ブラッシュアップ不要 - 現状で実用レベルに達しています
  {{/if}}
  
  ## 5. 次回評価計画
  ### 5.1 再評価スケジュール
  {{#if re_evaluation_needed}}
  - **予定日**: {{next_evaluation_date}}
  - **評価重点**: {{evaluation_focus}}
  - **成功基準**: {{success_criteria}}
  {{else}}
  - **定期評価**: {{regular_evaluation_schedule}}
  - **トリガー評価**: 機能追加・大幅変更時
  {{/if}}
  
  ### 5.2 継続的改善計画
  {{#each continuous_improvement_plan}}
  - **{{improvement_area}}**: {{plan_description}}
    - 実施頻度: {{frequency}}
    - 責任者: {{responsible_person}}
  {{/each}}
  
  ## 6. 実装推奨事項
  ### 6.1 即座実行すべきアクション
  {{#each immediate_actions}}
  1. **{{action_title}}**: {{action_description}}
     - 期限: {{deadline}}
     - 責任者: {{responsible_person}}
  {{/each}}
  
  ### 6.2 長期的改善方針
  {{#each long_term_improvements}}
  - **{{improvement_area}}**: {{strategy_description}}
    - タイムライン: {{timeline}}
    - リソース要件: {{resource_requirements}}
  {{/each}}
  
  ---
  **ファイル**: comprehensive_validation_{{target_agent}}_{{env.NOW:date:YYYY-MM-DD}}.md
  **エージェント状態**: {{agent_status}}
  **次ステップ**: {{next_recommended_action}}

## CLAUDE.md新フォーマット対応トリガー設計

### master_triggers設計例（CLAUDE.md準拠）

```yaml
master_triggers:
  # -----
  # 検証開始フェーズ (A-01. agent_validation)
  # -----
  - trigger: "(エージェント検証|品質評価|validation|記述規則確認)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**エージェント検証を開始します。**\n\n生成されたエージェントファイルの包括的な品質評価を行います。検証対象をお聞きします。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_validation_questions"
        action: "call agent_validation.md => syntax_questions"
      - name: "create_validation_output"
        action: "create_markdown_file"
        path: "{{patterns.output_validation_report}}"
        template_reference: "agent_validation.md => syntax_compliance_template"
      - name: "completion_message"
        action: "message"
        content: "**記述規則準拠性検証が完了しました。**\n\n保存場所: `{{patterns.output_validation_report}}`\n\n次ステップ: 機能充足性検証を実施できます。"

  # -----
  # 機能充足性検証フェーズ (A-02. functional_completeness)
  # -----
  - trigger: "(機能充足性検証|業界標準確認|functional completeness)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**機能充足性検証を開始します。**\n\n業界標準準拠・ワークフロー網羅・機能連携・実務適用性を評価します。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_functional_questions"
        action: "call agent_validation.md => functional_questions"
      - name: "create_functional_output"
        action: "create_markdown_file"
        path: "{{patterns.output_functional_validation}}"
        template_reference: "agent_validation.md => functional_completeness_template"
      - name: "completion_message"
        action: "message"
        content: "**機能充足性検証が完了しました。**\n\n保存場所: `{{patterns.output_functional_validation}}`\n\n次ステップ: ゴール適合性検証を実施できます。"

  # -----
  # ゴール適合性検証フェーズ (A-03. goal_alignment)
  # -----
  - trigger: "(ゴール適合性検証|要件適合確認|goal alignment)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**ゴール適合性検証を開始します。**\n\n初期要件・ユーザー適合・効率化効果・成功基準を評価します。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_goal_questions"
        action: "call agent_validation.md => goal_questions"
      - name: "create_goal_output"
        action: "create_markdown_file"
        path: "{{patterns.output_goal_validation}}"
        template_reference: "agent_validation.md => goal_alignment_template"
      - name: "completion_message"
        action: "message"
        content: "**ゴール適合性検証が完了しました。**\n\n保存場所: `{{patterns.output_goal_validation}}`\n\n次ステップ: 実用性検証を実施できます。"

  # -----
  # 実用性検証フェーズ (A-04. practical_utility)
  # -----
  - trigger: "(実用性検証|質問品質確認|practical utility)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**実用性検証を開始します。**\n\n質問品質・テンプレート品質・エラーハンドリング・拡張性を評価します。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "ask_utility_questions"
        action: "call agent_validation.md => utility_questions"
      - name: "create_utility_output"
        action: "create_markdown_file"
        path: "{{patterns.output_utility_validation}}"
        template_reference: "agent_validation.md => practical_utility_template"
      - name: "completion_message"
        action: "message"
        content: "**実用性検証が完了しました。**\n\n保存場所: `{{patterns.output_utility_validation}}`\n\n次ステップ: 総合評価レポートを作成できます。"

  # -----
  # 総合評価フェーズ (A-05. comprehensive_evaluation)
  # -----
  - trigger: "(総合評価|品質評価総合|comprehensive evaluation)"
    priority: high
    steps:
      - name: "start_message"
        action: "message"
        content: "**総合評価を開始します。**\n\n4観点の評価結果を統合し、ブラッシュアップ計画を策定します。"
      - name: "collect_existing_info"
        action: "gather_existing_info"
      - name: "create_comprehensive_output"
        action: "create_markdown_file"
        path: "{{patterns.output_comprehensive_evaluation}}"
        template_reference: "agent_validation.md => comprehensive_validation_template"
      - name: "completion_message"
        action: "message"
        content: "**総合評価が完了しました。**\n\n保存場所: `{{patterns.output_comprehensive_evaluation}}`\n\nエージェントの品質評価とブラッシュアップ計画が完成しました。"
```

validation_rules:
  syntax_compliance_validation:
    - criteria: "YAML構文エラーがないこと"
    - criteria: "ルール番号体系に準拠していること"
    - criteria: "ファイル構造が適切であること"
    - criteria: "パスパターンが解決可能であること"

  functional_completeness_validation:
    - criteria: "業界標準に準拠していること"
    - criteria: "主要業務プロセスがカバーされていること"
    - criteria: "機能間連携が適切であること"
    - criteria: "実務で即座使用可能であること"

  goal_alignment_validation:
    - criteria: "初期要件を満たしていること"
    - criteria: "ターゲットユーザーに適合していること"
    - criteria: "業務効率化効果が見込まれること"
    - criteria: "成功基準達成が可能であること"

  practical_utility_validation:
    - criteria: "質問が実務に即していること"
    - criteria: "テンプレートが実用的であること"
    - criteria: "エラーハンドリングが包括的であること"
    - criteria: "拡張性・保守性が確保されていること"
