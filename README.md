
cat openai.mp3-noturbo-large.json | jq -Cc '.text' | tee for_yukari5.txt


insanely-fast-whisper \
  --file-name 006.m4a \
  --device-id mps \
  --model-name openai/whisper-large-v3 \
  --batch-size 4 \
  --transcript-path openai.mp3-noturbo-large.json
