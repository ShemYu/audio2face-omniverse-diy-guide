docker run -it --rm --gpus all \
    --network=host \
    --name anim-graph-ms \
    -v ~/docker-unreal/default-avatar-scene_v1.0.0:/home/ace/asset \
    nvcr.io/nvidia/ace/ia-animation-graph-microservice:1.0.2

