workflow "benchmark on sentiment analysis" {
  resolves = "run benchmark"
}

action "download_and_verify" {
  uses = "docker://paddlepaddle/paddle:1.6.2-gpu-cuda9.0-cudnn7"
  args = "bash ./sentiment_analysis/scripts/download_and_verify.sh"
}

action "run benchmark" {
  needs="download_and_verify"
  uses = "docker://paddlepaddle/paddle:1.6.2-gpu-cuda9.0-cudnn7"
  runs = "/bin/bash ./sentiment_analysis/paddle/run_and_time.sh 2 -g"
}
