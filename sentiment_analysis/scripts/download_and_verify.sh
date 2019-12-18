#!/bin/bash

set -e

python ./sentiment_analysis/scripts/download.py
python ./sentiment_analysis/scripts/verify.py

# mv $HOME/.cache/paddle/dataset/imdb/aclImdb_v1.tar.gz $HOME/.cache/paddle/dataset/imdb/imdb%2FaclImdb_v1.tar.gz