#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# JTCCommunity Agent - MD to MDC Conversion Script
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
    source_dir = os.path.join(root_dir, "cursor_bank")
    dest_dir = os.path.join(root_dir, ".cursor", "rules")
    
    # Make sure the source directory exists
    if not os.path.exists(source_dir):
        os.makedirs(source_dir, exist_ok=True)
        print(f"Created source directory: {source_dir}")
    
    # Make sure the destination directory exists
    if not os.path.exists(dest_dir):
        os.makedirs(dest_dir, exist_ok=True)
        print(f"Created destination directory: {dest_dir}")
    
    # Get all .md files in the source directory
    md_files = [f for f in os.listdir(source_dir) if f.endswith(".md")]
    
    # Get all .mdc files in the destination directory
    mdc_files = [f for f in os.listdir(dest_dir) if f.endswith(".mdc")]
    
    # Convert the filenames for comparison
    mdc_basenames = [os.path.splitext(f)[0] for f in mdc_files]
    
    # Track files processed and changes made
    processed_files = 0
    updated_files = 0
    
    # Process each .md file
    for md_file in md_files:
        base_name = os.path.splitext(md_file)[0]
        
        # Check if there's a matching .mdc file
        if base_name in mdc_basenames:
            source_path = os.path.join(source_dir, md_file)
            dest_path = os.path.join(dest_dir, f"{base_name}.mdc")
            
            # Read the contents of both files
            with open(source_path, 'r', encoding='utf-8') as f:
                source_content = f.read()
            
            dest_content = ""
            if os.path.exists(dest_path):
                try:
                    with open(dest_path, 'r', encoding='utf-8') as f:
                        dest_content = f.read()
                except Exception as e:
                    print(f"Error reading destination file {dest_path}: {e}")
                
            # Only update if contents are different
            if source_content != dest_content:
                try:
                    # Write the new content without creating a backup
                    with open(dest_path, 'w', encoding='utf-8') as f:
                        f.write(source_content)
                    print(f"Updated: {dest_path}")
                    updated_files += 1
                except Exception as e:
                    print(f"Error updating file {dest_path}: {e}")
            else:
                print(f"No changes needed for: {dest_path}")
            
            processed_files += 1
        else:
            print(f"No matching .mdc file found for: {md_file}")
    
    return processed_files, updated_files

if __name__ == "__main__":
    processed, updated = convert_files()
    print(f"\nSummary:")
    print(f"Total files processed: {processed}")
    print(f"Files updated: {updated}")
