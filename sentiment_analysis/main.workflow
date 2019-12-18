workflow "benchmark on sentiment analysis" {
  resolves = "run benchmark"
}

action "pre process data" {
  uses = "docker://paddlepaddle/paddle:1.6.2"
  args = "bash ./sentiment_analysis/pre_process_data.sh"
}

action "run benchmark" {
  needs="pre process data"
  uses = "docker://paddlepaddle/paddle:1.6.2"
  runs = "/bin/bash ./sentiment_analysis/paddle/run_and_time.sh 2"
}
