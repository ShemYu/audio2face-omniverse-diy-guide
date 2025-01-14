docker run --rm --network=host -it --gpus all nvcr.io/nvidia/ace/audio2face:1.0.11

# 進入容器並執行模型生成指令
docker exec -it $(docker ps -q --filter ancestor=nvcr.io/nvidia/ace/audio2face:1.0.11) /bin/bash -c "\
  ./service/generate_trt_model.py built-in claire_v1.3 && \
  ./service/generate_a2e_trt_model.py"


# 在容器內啟動 A2F 服務
docker exec -it $(docker ps -q --filter ancestor=nvcr.io/nvidia/ace/audio2face:1.0.11) /bin/bash -c "./service/launch_service.py service/a2f_config.yaml"
