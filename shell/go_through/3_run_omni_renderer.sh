docker run --env IAORMS_RTP_NEGOTIATION_HOST_MOCKING_ENABLED=true \
    --rm \
    --gpus all \
    --network=host \
    --name renderer-ms \
    -v ~/docker-unreal/default-avatar-scene_v1.0.0:/home/ace/asset \
    nvcr.io/nvidia/ace/ia-omniverse-renderer-microservice:1.0.5
