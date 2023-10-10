#!/bin/bash

# 定义需要执行的命令
declare -a arr=("CUDA_VISIBLE_DEVICES=0 python sample.py --restore_path model_output/girl2_new_5000 --prompt_path eval_prompts/girl2_edit.json --output_path outputs/girl2_edit_5000"
                "CUDA_VISIBLE_DEVICES=0 python sample.py --restore_path model_output/girl2_new_4000 --prompt_path eval_prompts/girl2_edit.json --output_path outputs/girl2_edit_4000"
                "CUDA_VISIBLE_DEVICES=0 python sample.py --restore_path model_output/girl2_new_3000 --prompt_path eval_prompts/girl2_edit.json --output_path outputs/girl2_edit_3000"
                "CUDA_VISIBLE_DEVICES=0 python sample.py --restore_path model_output/girl2_new_2000 --prompt_path eval_prompts/girl2_edit.json --output_path outputs/girl2_edit_2000"
                "CUDA_VISIBLE_DEVICES=0 python sample.py --restore_path model_output/girl2_new_1000 --prompt_path eval_prompts/girl2_edit.json --output_path outputs/girl2_edit_1000")

# 循环检查GPU状态并执行命令
for i in "${arr[@]}"; do
  # 检查GPU状态
  while [ $(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits -i 0) -ne 0 ]; do
    # 如果GPU不空闲，则等待一段时间再次检查
    echo "GPU is busy, waiting for it to become free..."
    sleep 10
  done

  # 执行命令
  echo "Executing command: $i"
  eval $i
done

echo "All commands have been executed. Exiting..."
