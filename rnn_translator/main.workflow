workflow "benchmark on RNN tarnslator" {
  resolves = "run benchmark"
}

action "download data" {
  uses = "./rnn_translator/dockerfiles/pytorch-nocuda/"
  args = "bash ./rnn_translator/scripts/download.sh"
}

action "verify data" {
  needs="download data"
  uses = "./rnn_translator/dockerfiles/pytorch-nocuda/"
  args = "bash ./rnn_translator/scripts/verify.sh"
}

action "run benchmark" {
  needs="verify data"
  uses = "./rnn_translator/dockerfiles/pytorch-nocuda/"
  runs = "/bin/bash ./rnn_translator/pytorch/run_and_time.sh 2"
  env = {
    LANG="C.UTF-8"
    LC_ALL="C.UTF-8"
  }
}
