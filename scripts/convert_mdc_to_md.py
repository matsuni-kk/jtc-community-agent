#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# JTCCommunity Agent - MDC to MD Conversion Script
import os
import sys
import platform
import re

def find_root_directory():
    # スクリプトの場所を取得
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # root.mdはscriptsディレクトリ内にある
    root_md_path = os.path.join(script_dir, 'root.md')
    
    # スクリプトの親ディレクトリをデフォルトのルートとする
    default_root_dir = os.path.dirname(script_dir)  # Agent root directory

    if not os.path.exists(root_md_path):
        print(f"Error: root.md not found at {root_md_path}, using parent directory as fallback.")
        return default_root_dir
    
    # root.mdからルートディレクトリを抽出
    with open(root_md_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # OSに応じたパスを抽出
    if platform.system() == "Darwin":  # macOS
        match = re.search(r'Mac:\s*([^\n]+)', content)
        if match:
            return match.group(1).strip()
    elif platform.system() == "Windows":
        match = re.search(r'Windows:\s*([^\n]+)', content)
        if match:
            return match.group(1).strip()
    
    # root.mdから抽出できなかった場合、親ディレクトリを返す
    print(f"Warning: Could not extract path from {root_md_path}. Assuming parent directory is root.")
    return default_root_dir

def convert_files():
    root_dir = find_root_directory()
    source_dir = os.path.join(root_dir, ".cursor", "rules")  # mdcファイルのソース
    dest_dir = os.path.join(root_dir, "cursor_bank")         # mdファイルのデスティネーション
    
    # Make sure the source directory exists
    if not os.path.exists(source_dir):
        print(f"Error: Source directory not found: {source_dir}")
        sys.exit(1)
    
    # Make sure the destination directory exists
    if not os.path.exists(dest_dir):
        os.makedirs(dest_dir, exist_ok=True)
        print(f"Created destination directory: {dest_dir}")
    
    # Get all .mdc files in the source directory
    mdc_files = [f for f in os.listdir(source_dir) if f.endswith(".mdc")]
    
    # Get all .md files in the destination directory
    md_files = [f for f in os.listdir(dest_dir) if f.endswith(".md")]
    
    # Convert the filenames for comparison
    md_basenames = [os.path.splitext(f)[0] for f in md_files]
    
    # Track files processed and changes made
    processed_files = 0
    updated_files = 0
    created_files = 0
    
    # Process each .mdc file
    for mdc_file in mdc_files:
        base_name = os.path.splitext(mdc_file)[0]
        
        source_path = os.path.join(source_dir, mdc_file)
        dest_path = os.path.join(dest_dir, f"{base_name}.md")
        
        # Read the contents of the source .mdc file
        try:
            with open(source_path, 'r', encoding='utf-8') as f:
                source_content = f.read()
        except Exception as e:
            print(f"Error reading source file {source_path}: {e}")
            continue
        
        # Check if destination .md file exists
        dest_content = ""
        file_exists = os.path.exists(dest_path)
        
        if file_exists:
            try:
                with open(dest_path, 'r', encoding='utf-8') as f:
                    dest_content = f.read()
            except Exception as e:
                print(f"Error reading destination file {dest_path}: {e}")
                dest_content = ""
        
        # Only update if contents are different or file doesn't exist
        if not file_exists or source_content != dest_content:
            try:
                # Write the new content
                with open(dest_path, 'w', encoding='utf-8') as f:
                    f.write(source_content)
                
                if file_exists:
                    print(f"Updated: {dest_path}")
                    updated_files += 1
                else:
                    print(f"Created: {dest_path}")
                    created_files += 1
                    
            except Exception as e:
                print(f"Error writing file {dest_path}: {e}")
        else:
            print(f"No changes needed for: {dest_path}")
        
        processed_files += 1
    
    return processed_files, updated_files, created_files

if __name__ == "__main__":
    processed, updated, created = convert_files()
    print(f"\nSummary:")
    print(f"Total .mdc files processed: {processed}")
    print(f"Existing .md files updated: {updated}")
    print(f"New .md files created: {created}") 