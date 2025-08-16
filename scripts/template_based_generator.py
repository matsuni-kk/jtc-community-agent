#!/usr/bin/env python3
"""
Template-Based Agent Generation Script
手作りテンプレートをベースとした高品質エージェント生成

Usage:
    python template_based_generator.py --template marketing
    python template_based_generator.py --template babok
"""

import os
import sys
import shutil
import argparse
from pathlib import Path
from typing import Dict, List
from agent_config_templates import AgentConfig, has_template_files

class TemplateBasedGenerator:
    def __init__(self, template_dir: str, output_base_dir: str):
        self.template_dir = Path(template_dir)
        self.output_base_dir = Path(output_base_dir)
        
        # 利用可能なテンプレート定義
        self.available_templates = {
            "marketing": {
                "master_rules": "00_master_rules_sample_marketing.md",
                "paths": "marketing_paths_complete.mdc",
                "agent_name": "Marketing",
                "domain": "marketing",
                "description": "AMAマーケティングBOKに基づいたマーケティング業務を支援するエージェント"
            },
            "babok": {
                "master_rules": "00_master_rules_sample_babok.md",
                "paths": "babok_paths.mdc",  # 既存のものを使用
                "agent_name": "BABOK", 
                "domain": "babok",
                "description": "BABOK準拠のビジネスアナリシス業務を支援するエージェント"
            },
            "legal": {
                "master_rules": "00_master_rules_sample_legal.md",
                "paths": "legal_paths_complete.mdc",
                "agent_name": "Legal",
                "domain": "legal",
                "description": "企業法務BOKに基づいた法務業務を支援するエージェント"
            },
        }
    
    def generate_agent(self, template_name: str = None, custom_config: AgentConfig = None) -> Path:
        """手作りテンプレートベースでエージェント生成"""
        if custom_config:
            print(f"🚀 Starting Template-Based Agent Generation for {custom_config.domain}...")
            template_config = {
                "domain": custom_config.domain,
                "agent_name": custom_config.agent_name,
                "description": custom_config.description
            }
            agent_dir = self.output_base_dir / f"{custom_config.domain}_agent"
        elif template_name:
            print(f"🚀 Starting Template-Based Agent Generation for {template_name}...")
            if template_name not in self.available_templates:
                raise ValueError(f"Template '{template_name}' not found. Available: {list(self.available_templates.keys())}")
            template_config = self.available_templates[template_name]
            agent_dir = self.output_base_dir / f"{template_config['domain']}_agent"
        else:
            raise ValueError("Either template_name or custom_config must be provided")
        
        try:
            # 既存ディレクトリのチェック
            if agent_dir.exists():
                response = input(f"⚠️  Directory {agent_dir} already exists. Overwrite? (y/n): ")
                if response.lower() != 'y':
                    print("Aborted.")
                    return None
                shutil.rmtree(agent_dir)
            
            print(f"Target directory: {agent_dir}")
            
            # 1. 基本ディレクトリ構造の作成
            self.create_directory_structure(agent_dir, template_config, custom_config)
            print("✓ Directory structure created.")
            
            # 2. テンプレートファイルの処理
            if custom_config and has_template_files(custom_config.domain, self.template_dir / "cursor_bank"):
                self.copy_template_files(agent_dir, template_config)
                print("✓ Custom template files copied.")
            elif not custom_config:
                self.copy_template_files(agent_dir, template_config)
                print("✓ Template files copied.")
            else:
                print("⚠️  No custom template files found, using generated rules.")
            
            # 3. 共通ルールファイルのコピー・変換
            self.copy_common_rules(agent_dir, template_config)
            print("✓ Common rules copied and transformed.")
            
            # 4. 自動化スクリプトのコピー
            self.copy_automation_scripts(agent_dir)
            print("✓ Automation scripts copied.")
            
            # 5. README.mdの生成
            self.generate_readme(agent_dir, template_config)
            print("✓ README.md generated.")
            
            print("\n🎉 Template-Based Agent Generation Completed Successfully!")
            return agent_dir
            
        except Exception as e:
            print(f"\n❌ Error during agent generation: {e}")
            raise
    
    def create_directory_structure(self, agent_dir: Path, template_config: Dict, custom_config: AgentConfig = None):
        """ディレクトリ構造を作成"""
        # 基本構造
        base_dirs = [
            "Flow/Public", "Flow/Private",
            "Stock",
            "Archived",
            "cursor_bank", 
            "scripts",
            ".cursor/rules", ".cursor/templates"
        ]
        
        for dir_path in base_dirs:
            (agent_dir / dir_path).mkdir(parents=True, exist_ok=True)
        
        # カスタム設定がある場合、stock_subdirsを作成
        if custom_config and custom_config.get_stock_subdirs():
            for subdir in custom_config.get_stock_subdirs():
                (agent_dir / "Stock" / subdir).mkdir(parents=True, exist_ok=True)
        
        # keep ファイル作成
        for keep_dir in ["Flow", "Stock", "Archived"]:
            if (agent_dir / keep_dir).exists():
                (agent_dir / keep_dir / "keep").touch()
    
    def copy_template_files(self, agent_dir: Path, template_config: Dict):
        """手作りテンプレートファイルをコピー"""
        template_bank = self.template_dir / "cursor_bank"
        target_bank = agent_dir / "cursor_bank"
        target_rules = agent_dir / ".cursor" / "rules"
        
        domain = template_config['domain']
        
        # 1. マスタールールのコピー
        master_rules_file = template_config['master_rules']
        source_master = template_bank / master_rules_file
        
        if source_master.exists():
            # cursor_bankにオリジナルをコピー
            shutil.copy2(source_master, target_bank / f"00_master_rules.md")
            
            # .cursor/rulesに.mdc版をコピー
            content = source_master.read_text(encoding='utf-8')
            (target_rules / "00_master_rules.mdc").write_text(content, encoding='utf-8')
        else:
            print(f"⚠️  Warning: Master rules template not found: {master_rules_file}")
        
        # 2. パスファイルのコピー
        paths_file = template_config['paths']
        source_paths = template_bank / paths_file
        
        if source_paths.exists():
            # cursor_bankにコピー
            shutil.copy2(source_paths, target_bank / f"{domain}_paths.mdc")
            
            # .cursor/rulesにもコピー
            shutil.copy2(source_paths, target_rules / f"{domain}_paths.mdc")
        else:
            print(f"⚠️  Warning: Paths template not found: {paths_file}")
    
    def copy_common_rules(self, agent_dir: Path, template_config: Dict):
        """共通ルールファイルをコピー・変換"""
        template_bank = self.template_dir / "cursor_bank"
        target_rules = agent_dir / ".cursor" / "rules"
        
        agent_name = template_config['agent_name']
        domain = template_config['domain']
        
        # 共通ルール一覧
        common_rules = [
            "90_task_management.md",
            "97_flow_to_stock_rules.md", 
            "98_flow_assist.md",
            "99_rule_maintenance.md"
        ]
        
        replacements = {
            "{{agent_name}}": agent_name,
            "{{domain}}": domain,
            "{{Agent_Name}}": agent_name.capitalize()
        }
        
        for rule_file in common_rules:
            source_file = template_bank / rule_file
            if source_file.exists():
                content = source_file.read_text(encoding='utf-8')
                
                # 変数置換
                for old, new in replacements.items():
                    content = content.replace(old, new)
                
                # .mdcとして保存
                target_file = target_rules / source_file.with_suffix(".mdc").name
                target_file.write_text(content, encoding='utf-8')
    
    def copy_automation_scripts(self, agent_dir: Path):
        """自動化スクリプトをコピー"""
        template_scripts = self.template_dir / "scripts"
        target_scripts = agent_dir / "scripts"
        
        if not template_scripts.exists():
            return
            
        # 基本スクリプト群をコピー（生成スクリプト自体は除く）
        exclude_files = [
            "enhanced_generate_agent.py",
            "template_based_generator.py", 
            "agent_config_templates.py"
        ]
        
        for script_file in template_scripts.glob("*.py"):
            if script_file.name not in exclude_files:
                try:
                    shutil.copy2(script_file, target_scripts)
                except Exception as e:
                    print(f"⚠️  Warning: Could not copy {script_file.name}: {e}")
        
        # シェルスクリプトもコピー
        for script_file in template_scripts.glob("*.sh"):
            try:
                shutil.copy2(script_file, target_scripts)
                # 実行権限を付与
                os.chmod(target_scripts / script_file.name, 0o755)
            except Exception as e:
                print(f"⚠️  Warning: Could not copy {script_file.name}: {e}")
    
    def generate_readme(self, agent_dir: Path, template_config: Dict):
        """エージェント用のREADME.mdを生成"""
        agent_name = template_config['agent_name']
        domain = template_config['domain']
        description = template_config['description']
        
        readme_content = f'''# {agent_name} Agent

{description}

## 概要

このリポジトリは、{agent_name}ドメインに特化したLLMエージェントシステムです。
Cursor IDEと統合して、{domain}関連のタスクを効率的に実行します。

## 特徴

- **手作りの高品質ワークフロー**: 機械生成ではなく、業務専門知識に基づいて設計
- **完全なテンプレート**: 実務で即使用可能な詳細テンプレート
- **AMA/BABOK準拠**: 業界標準に基づいた構造化されたアプローチ

## セットアップ

### 1. リポジトリのクローン
```bash
git clone <repository-url> {domain}_agent
cd {domain}_agent
```

### 2. Cursor IDEでの利用
1. Cursor IDEでこのディレクトリを開く
2. `.cursor/rules/`ディレクトリに変換済みのルールが配置されています
3. エージェントが自動的に有効になります

## 使い方

### 基本的なトリガー
- `{domain}プロジェクト開始`: プロジェクトを初期化
- `今日のタスク作成`: 日次タスクファイルを作成

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

## ライセンス

[ライセンス情報を追加]

## 貢献

[貢献ガイドラインを追加]
'''
        
        readme_file = agent_dir / "README.md"
        with open(readme_file, 'w', encoding='utf-8') as f:
            f.write(readme_content)

def generate_custom_agent(domain: str, agent_name: str, description: str, framework: str = "") -> Path:
    """汎用エージェント生成関数"""
    from agent_config_templates import create_custom_agent_config
    
    template_dir = Path(__file__).parent.parent
    output_base_dir = template_dir / "output"
    
    # カスタム設定作成
    config = create_custom_agent_config(
        agent_name=agent_name,
        domain=domain,
        description=description,
        framework=framework
    )
    
    # ジェネレーター実行
    generator = TemplateBasedGenerator(template_dir, output_base_dir)
    return generator.generate_agent(custom_config=config)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Template-Based Agent Generation Script")
    parser.add_argument("--template", 
                       choices=["marketing", "babok", "legal"],
                       help="Template name to use")
    parser.add_argument("--domain", help="Custom domain name")
    parser.add_argument("--agent-name", help="Custom agent name")
    parser.add_argument("--description", help="Custom agent description")
    parser.add_argument("--framework", help="Framework name (optional)")
    
    args = parser.parse_args()
    
    # デフォルトのパス設定
    template_dir = Path(__file__).parent.parent
    output_base_dir = template_dir / "output"
    
    try:
        if args.template:
            # 既存テンプレート使用
            generator = TemplateBasedGenerator(template_dir, output_base_dir)
            agent_dir = generator.generate_agent(args.template)
        elif args.domain and args.agent_name and args.description:
            # カスタムエージェント生成
            agent_dir = generate_custom_agent(
                domain=args.domain,
                agent_name=args.agent_name,
                description=args.description,
                framework=args.framework or ""
            )
        else:
            print("❌ Either --template OR (--domain, --agent-name, --description) must be provided")
            parser.print_help()
            sys.exit(1)
        
        if agent_dir:
            print(f"\n✨ Agent successfully generated at: {agent_dir}")
    except Exception as e:
        print(f"\n❌ Error: {e}")
        sys.exit(1)