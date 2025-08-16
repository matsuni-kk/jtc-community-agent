---
description: "JTCCommunity Flow to Stock Rules"
globs:
alwaysApply: true
---

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
