workflow "benchmark on sentiment analysis" {
  resolves = "test"
}

action "test" {
  uses = "./sentiment_analysis/"
}