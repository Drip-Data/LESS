#!/bin/bash

ID=$RANDOM
export header="accelerate launch  \
-m less.train.train"

export base_training_args="--do_train True \
--max_seq_length 2048 \
--use_fast_tokenizer True \
--lr_scheduler_type linear \
--warmup_ratio 0.03 \
--weight_decay 0.0 \
--evaluation_strategy no \
--logging_steps 1 \
--save_strategy no \
--num_train_epochs 5 \
--bf16 True \
--tf32 False \
--fp16 False \
--overwrite_output_dir True \
--optim adamw_torch \
--seed 0 \
--percentage 1.0 \
--save_strategy epoch \
--lora True \
--lora_dropout 0.1 \
--lora_target_modules q_proj k_proj v_proj o_proj \
--learning_rate 2e-05 \
--per_device_train_batch_size 2 \
--gradient_accumulation_steps 16"