# Copyright 2021 Andreas Sagen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM python:3.9.2-slim AS build

FROM exterex/base-dev

ENV LANG C.UTF-8

RUN sudo apt update; \
    sudo apt --assume-yes install --no-install-recommends \
        libexpat1 \
        zlib1g \
        libssl1.1 \
        libbz2-1.0 \
        libc6 \
        libcrypt1 \
        libdb5.3 \
        libffi7 \
        liblzma5 \
        libncursesw6 \
        libmpdec2 \
        libreadline8 \
        libsqlite3-0 \
        libtinfo6 \
        libuuid1 \
        mime-support; \
    sudo rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND noninteractive

COPY --from=build /usr/local /usr/local

RUN sudo ldconfig \
    && cd /usr/local/bin \
    && sudo rm -r idle* 2to3* \
    && python --version

ENV DEBIAN_FRONTEND dialog

CMD [ "bash" ]
