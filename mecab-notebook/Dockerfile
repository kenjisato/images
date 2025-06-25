FROM quay.io/jupyter/scipy-notebook:2025-06-23

USER root

# Install MeCab + NEologd
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        mecab \
        libmecab-dev \
        mecab-ipadic-utf8 \
        file && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/neologd/mecab-ipadic-neologd.git /tmp/mecab-ipadic-neologd && \
    cd /tmp/mecab-ipadic-neologd && \
    git checkout afb0013e3303d49f7fd4beb541644be154be563e && \
    ./bin/install-mecab-ipadic-neologd -n -y && \
    NEODIR=$(mecab-config --dicdir)/mecab-ipadic-neologd && \
    echo "dicdir = ${NEODIR}" > /etc/mecabrc && \
    cp /etc/mecabrc /usr/local/etc/ && \
    rm -rf /tmp/mecab-ipadic-neologd


# Python libraries
RUN pip install --no-cache-dir \
    mecab-python3==1.0.6 \
    pyLDAvis==3.4.1 \
    scikit-learn==1.4.2 \
    pandas==2.2.2

# Sample notebooks
ENV NB_HOME=/home/jovyan
COPY notebooks/ ${NB_HOME}/samples/
RUN chown -R ${NB_UID}:${NB_GID} ${NB_HOME}/samples

# MeCab configs
ENV MECABRC=/usr/local/etc/mecabrc
ENV MECAB_DICDIR=/usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd

USER ${NB_UID}
WORKDIR ${NB_HOME}
