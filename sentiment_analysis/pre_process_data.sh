#!/bin/bash

set -e

python donwload.py
python verify.py

mv /root/.cache/paddle/dataset/imdb/aclImdb_v1.tar.gz /root/.cache/paddle/dataset/imdb/imdb%2FaclImdb_v1.tar.gz