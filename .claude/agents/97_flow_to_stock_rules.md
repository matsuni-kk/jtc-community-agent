---
name: 97_flow_to_stock_rules
description: JTCCommunity Flow to Stock Rules
---

path_reference: "jtc_paths.mdc"

prompt_purpose: |
  本ルールは、ドラフトの妥当性を確定し、版情報を付与してStockへ移行し、配布可能な最終版を確保します。
  例）本ルールは、［対象ドメイン］の事実を整え、合意形成と次アクションを高速化するためのルールです。

prompt_why_questions: |
  検証項目（必須フィールド、匿名化、参照整合、版情報）を揃え、移行時の事故を防止します。

prompt_why_templates: |
  1画面で確定情報を記録し、Flow→Stockの移動とアーカイブ手順を統一します。
  なぜそのテンプレートなのか

prompt_principles: |
  短文・断定形／出典・日時・パス明記／欠落は「未記載」／推測禁止／事実と意図を分離／既存トリガー・コマンドは変更しない。

# Flow to Stock Movement

flow_to_stock_process:
  steps:
    - validate_document
    - add_version_info
    - move_to_stock
    - archive_previous
  
  template: |
    # Document Finalization - {{env.NOW:date:YYYY-MM-DD}}
    
    ## Document Information
    - Domain: jtc
    - Version: v1.0
    - Finalized: {{env.NOW:datetime:YYYY-MM-DD HH:mm:ss}}
