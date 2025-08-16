# JTCCommunity Agent

JapanTraditionalcompanyコミュニティのイベント・ナレッジ整理エージェント

## 概要

このリポジトリは、JTCCommunityドメインに特化したLLMエージェントシステムです。
Cursor IDEと統合して、jtc関連のタスクを効率的に実行します。

## 主な機能

### JTCCommunity特化機能
- ドメイン固有のワークフロー
- 専用のドキュメントテンプレート
- 自動化されたタスク管理

## セットアップ

### 1. リポジトリのクローン
```bash
git clone <repository-url> jtc_agent
cd jtc_agent
```

### 2. Cursor IDEでの利用
1. Cursor IDEでこのディレクトリを開く
2. `.cursor/rules/`ディレクトリに変換済みのルールが配置されています
3. エージェントが自動的に有効になります

### 3. ルールの更新（必要に応じて）
```bash
python scripts/convert_md_to_mdc.py
```

## 使い方

### 基本的なトリガー
- `jtc初期化`: プロジェクトをセットアップ

### ディレクトリ構成
- `Flow/`: 作業中のドキュメント
- `Stock/`: 確定済みドキュメント
- `cursor_bank/`: ルールファイル（編集用）
- `.cursor/rules/`: 変換済みルール（Cursor用）

## カスタマイズ

### ルールの追加・編集
1. `cursor_bank/`内の`.md`ファイルを編集
2. `python scripts/convert_md_to_mdc.py`を実行
3. Cursorを再起動

### 新しいワークフローの追加
`cursor_bank/`に新しいルールファイルを作成し、必要なトリガーとアクションを定義してください。

## ライセンス

[ライセンス情報を追加]

## 貢献

[貢献ガイドラインを追加]
