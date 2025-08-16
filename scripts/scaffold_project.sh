#!/usr/bin/env bash
# scaffold_project.sh - プロジェクト用ディレクトリ構造生成スクリプト
# NOTE: 変数やパラメータを空欄のままにせず必ず指定してください。
# Usage: scaffold_project.sh PROGRAM_ID PROJECT_ID
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
STOCK="$ROOT/Stock"
PID="$1"
PROJ="$2"

mkdir -p \
  "$STOCK/projects/$PID/documents/1_planning" \
  "$STOCK/projects/$PID/documents/2_elicitation" \
  "$STOCK/projects/$PID/documents/3_rlcm" \
  "$STOCK/projects/$PID/documents/4_strategy" \
  "$STOCK/projects/$PID/documents/5_analysis_design" \
  "$STOCK/projects/$PID/documents/6_evaluation" \
  "$STOCK/projects/$PID/documents/6_closing" \
  "$STOCK/projects/$PID/backlog"
