# rusEFI firmware build Docker image

ARG UBUNTU_VERSION=22.04
FROM rusefi/build-base:ubuntu-${UBUNTU_VERSION}

ARG RUSEFI_DIR=/rusefi
#ARG PROJECT_BOARD
#ENV PROJECT_BOARD=${PROJECT_BOARD:-}
#ARG PROJECT_CPU
#ENV PROJECT_CPU=${PROJECT_CPU:-}
#ARG COMPILE_ARGS="PROJECT_BOARD=${PROJECT_BOARD} PROJECT_CPU=${PROJECT_CPU}"
#ENV COMPILE_ARGS=${COMPILE_ARGS:-}
#ARG BUILD_ARGS
#ENV BUILD_ARGS=${BUILD_ARGS:-}

WORKDIR ${RUSEFI_DIR}

WORKDIR ./rusefi/firmware
ENV PATH="$PATH:$RUSEFI_DIR/gcc-arm-none-eabi/bin"
ENTRYPOINT ["bash", "./docker_build.sh"]
