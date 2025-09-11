---
name: 90_task_management
description: JTCCommunity Task Management
---

path_reference: "jtc_paths.mdc"

prompt_purpose: |
  本ルールは、日次の作業優先度を明確化し、実行可能なタスク一覧を即時に用意します。
  例）本ルールは、［対象ドメイン］の事実を整え、合意形成と次アクションを高速化するためのルールです。

prompt_why_questions: |
  高優先/中優先/低優先の区分とメモを揃え、当日の判断コストを削減します。

prompt_why_templates: |
  1画面で当日タスクを見通し、外部共有やStandupに即利用できる形を保ちます。
  なぜそのテンプレートなのか

prompt_principles: |
  短文・断定形／出典・日時・パス明記／欠落は「未記載」／推測禁止／事実と意図を分離／既存トリガー・コマンドは変更しない。

# Task Management

create_daily_task:
  template: |
    # Daily Tasks - {{env.NOW:date:YYYY-MM-DD}}
    
    ## jtc Domain Tasks
    
    ### High Priority
    - [ ] 
    
    ### Medium Priority
    - [ ] 
    
    ### Low Priority
    - [ ] 
    
    ### Notes
    - Created: {{env.NOW:datetime:YYYY-MM-DD HH:mm:ss}}
    - Domain: jtc
