CKPT=844

TRAINING_DATA_NAME=cot
TRAINING_DATA_FILE=./data/train/processed/cot/cot_data.jsonl # when changing data name, change the data path accordingly
GRADIENT_TYPE="adam"
MODEL_PATH=../out/llama3-1b-p0.05-lora-seed3/checkpoint-${CKPT}
OUTPUT_PATH=../grads/llama3-1b-p0.05-lora-seed3/${TRAINING_DATA_NAME}-ckpt${CKPT}-${GRADIENT_TYPE}
DIMS="1024"

./less/scripts/get_info/grad/get_train_lora_grads.sh "$TRAINING_DATA_FILE" "$MODEL_PATH" "$OUTPUT_PATH" "$DIMS" "$GRADIENT_TYPE"
