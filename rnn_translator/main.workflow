workflow "benchmark on RNN tarnslator" {
  resolves = "run benchmark"
}

action "download data" {
  uses = "docker://anibali/pytorch:no-cuda"
  args = "bash ./rnn_translator/scripts/download.sh"
}

action "verify data" {
  needs="download data"
  uses = "docker://anibali/pytorch:no-cuda"
  args = "bash ./rnn_translator/scripts/verify.sh"
}

action "run benchmark" {
  needs="verify data"
  uses = "docker://anibali/pytorch:no-cuda"
  runs = "/bin/bash ./rnn_translator/pytorch/run_and_time.sh 2"
  env = {
    LANG=C.UTF-8
    LC_ALL=C.UTF-8
  }
}
