workflow "Test and check formatting" {
  on = "push"
  resolves = ["Check formatting", "Test"]
}

action "Check formatting" {
  uses = "scottswezey/actions/mix@master"
  args = "format --check-formatted"
}

action "Get deps" {
  uses = "scottswezey/actions/mix@master"
  args = "deps.get"
}

action "Test" {
  uses = "scottswezey/actions/mix@master"
  needs = ["Get deps"]
  args = "test"
  env = {
    MIX_ENV = "test"
  }
}
