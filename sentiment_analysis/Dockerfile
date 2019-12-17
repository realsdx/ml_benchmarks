 
FROM paddlepaddle/paddle:latest

RUN mkdir -p /data/paddle

COPY paddle/* /data/paddle/
COPY download.py /data/download.py
COPY verify.py /data/verify.py

WORKDIR /data
RUN python download.py
RUN python verify.py

WORKDIR /root/.cache/paddle/dataset/imdb/
RUN cp aclImdb_v1.tar.gz imdb%2FaclImdb_v1.tar.gz

WORKDIR /data/paddle

ENTRYPOINT ["bash", "run_and_time.sh","2"]