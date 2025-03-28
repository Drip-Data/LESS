#!/bin/bash

source less/scripts/train/base_training_args.sh

train_files=$1
model_path=$2
job_name=$3
lora_r=$4
lora_alpha=$5

output_dir=../out/${job_name}
if [[ ! -d $output_dir ]]; then
    mkdir -p $output_dir
fi

# use fsdp for large models
if [[ $model_path == "meta-llama/Llama-2-13b-hf" ]]; then
    base_training_args="$base_training_args --fsdp 'full_shard auto_wrap' --fsdp_config llama2_13b_finetune"
    elif [[ $model_path == "mistralai/Mistral-7B-v0.1" ]]; then
    base_training_args="$base_training_args --fsdp 'full_shard auto_wrap' --fsdp_config mistral_7b_finetune"
fi

training_args="$base_training_args \
--model_name_or_path $model_path \
--output_dir $output_dir \
--lora_r $lora_r \
--lora_alpha $lora_alpha \
--train_files ${train_files[@]} 2>&1 | tee $output_dir/train.log"

echo "$header $training_args"
eval "$header" "$training_args"