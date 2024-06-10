
GPU="$1"
SET_SPLIT=5
SPLIT_IDX="$2"

N_SHOT=16
NUM_TRAIN_EPOCH=20

DATASET="eurosat"
N_CLS=10
FEWSHOT_SEED="seed0"


# for DATASET in "${DATASETS[@]}"; do
#     for FEWSHOT_SEED in "${FEWSHOT_SEEDS[@]}"; do
#     done
# done


# for FEWSHOT_SEED in "${FEWSHOT_SEEDS[@]}"; do

# for i in "${!DATASETS[@]}"; do
# DATASET=${DATASETS[i]}
# N_CLS=${N_CLSS[i]}


# Calculate CLASS_IDXS
START_RANGE=$(( (N_CLS / SET_SPLIT) * SPLIT_IDX))
END_RANGE=$(( (N_CLS / SET_SPLIT) * (SPLIT_IDX + 1) - 1 ))

# Check if SPLIT_IDX is equal to SET_SPLIT - 1
if [ $SPLIT_IDX -eq $((SET_SPLIT - 1)) ]; then
    FINAL_END_RANGE=$((N_CLS - 1))
else
    FINAL_END_RANGE=$END_RANGE
fi

CLASS_IDXS=($(seq $START_RANGE $FINAL_END_RANGE))

for CLASS_IDX in "${CLASS_IDXS[@]}"; do

# Run
# echo "DATASET $DATASET, SEED $FEWSHOT_SEED, CLASS IDX $CLASS_IDX"
CUDA_VISIBLE_DEVICES=$GPU, accelerate launch datadream.py \
--dataset=$DATASET \
--n_template=1 \
--fewshot_seed=$FEWSHOT_SEED \
--train_batch_size=8 \
--gradient_accumulation_steps=1 \
--learning_rate=1e-4 \
--lr_scheduler="cosine" \
--lr_warmup_steps=100 \
--num_train_epochs=$NUM_TRAIN_EPOCH \
--report_to="tensorboard" \
--train_text_encoder=True \
--is_tqdm=True \
--output_dir=outputs \
--n_shot=$N_SHOT \
--target_class_idx=$CLASS_IDX \
--resume_from_checkpoint=None \
$PARAM

done
# done
# done
