---
description: "JTCCommunity Agent Path Dictionary"
globs:
alwaysApply: true
---

# JTCCommunity Agent Paths

root: "/Users/matuni__/Desktop/agent_template/output/jtc_agent"

dirs:
  flow: "{{root}}/Flow"
  flow_public: "{{flow}}/Public"
  flow_private: "{{flow}}/Private"
  stock: "{{root}}/Stock"
  archived: "{{root}}/Archived"
  docs_root: "{{stock}}/documents"

patterns:
  flow_public_date: "{{flow_public}}/{{env.NOW:date:YYYY-MM-DD}}"
  draft_document: "{{flow_public_date}}/draft_{{document_name}}.md"
  stock_document: "{{docs_root}}/{{document_name}}.md"
  # JTC specific draft outputs
  draft_info_intake: "{{flow_public_date}}/draft_info_intake.md"
  draft_event_plan: "{{flow_public_date}}/draft_event_plan.md"
  draft_knowledge_note: "{{flow_public_date}}/draft_knowledge_note.md"
  draft_weekly_digest: "{{flow_public_date}}/draft_weekly_digest.md"
  # Direct outputs
  output_event_catalog: "{{docs_root}}/event_catalog_{{env.NOW:date:YYYY-MM-DD}}.md"
  output_knowledge_index: "{{docs_root}}/knowledge_index_{{env.NOW:date:YYYY-MM-DD}}.md"
  # Stock canonical outputs
  stock_event_log: "{{docs_root}}/events/event_log.md"
  stock_knowledge_base: "{{docs_root}}/knowledge/knowledge_base.md"
  stock_meetups_index: "{{docs_root}}/events/meetups_index.md"

meta:
  agent_name: "JTCCommunity"
  domain: "jtc"
