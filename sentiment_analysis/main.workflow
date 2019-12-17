workflow "benchmark on sentiment analysis" {
  resolves = "start docker container"
}

action "build docker image" {
  uses = "sh"
  args = [
    "docker build -t test_paddle .",
  ]
}

action "start docker container" {
  needs = "build docker image"
  uses = "sh"
  args = [
    "docker run --rm -it --name ptest test_paddle",
  ]
}