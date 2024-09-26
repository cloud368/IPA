#!/bin/bash

# 设置要搜索的目录
search_dir="debs"

# 使用 find 命令查找并删除文件名包含 Zone.Identifier 的文件
deleted_files=$(find "$search_dir" -type f -name "*Zone.Identifier*" -delete -print | wc -l)

# 使用 find 命令查找并删除目录名包含 Zone.Identifier 的文件夹
deleted_dirs=$(find "$search_dir" -type d -name "*Zone.Identifier*" -print -exec rm -rf {} + | wc -l)

# 计算总共删除的项目数量
total_deleted=$((deleted_files + deleted_dirs))

# 打印删除的文件和文件夹数量
echo "共删除了 $deleted_files 个包含 Zone.Identifier 的文件"
echo "共删除了 $deleted_dirs 个包含 Zone.Identifier 的文件夹"
echo "总共删除了 $total_deleted 个项目"
