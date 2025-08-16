---
doc_type: root_directory
project_id: jtc
created_at: {{env.NOW:date:YYYY-MM-DD}}
version: v1.0
---

# Root Directory - JTCCommunity Agent

このファイルはJTCCommunityエージェントのルートディレクトリを示します。

## Root Directory Path
このエージェントは独立したリポジトリとして設計されています。
クローン先のディレクトリがルートディレクトリとなります。

- Mac/Linux: `~/workspace/jtc_agent`
- Windows: `C:\workspace\jtc_agent`

## Agent Information
- **Agent Name**: JTCCommunity
- **Domain**: jtc
- **Description**: JapanTraditionalcompanyコミュニティのイベント・ナレッジ整理エージェント

## Directory Structure
```
jtc_agent/
├── Flow/           # 作業中のドキュメント
│   ├── Public/     # 公開可能な作業ドキュメント
│   └── Private/    # 非公開の作業ドキュメント
├── Stock/          # 確定済みドキュメント
├── Archived/       # アーカイブ
├── cursor_bank/    # ルールファイル（.md形式）
├── scripts/        # 自動化スクリプト
└── .cursor/        # Cursor設定
    └── rules/      # 変換済みルール（.mdc形式）
```

## Quick Start
1. このリポジトリをクローン
2. Cursorでこのディレクトリを開く
3. 必要に応じて `scripts/convert_md_to_mdc.py` を実行してルールを更新

## Specialized Features
### JTCCommunity特化機能
- ドメイン固有のワークフロー
- 専用のドキュメントテンプレート
- 自動化されたタスク管理
