locals {
  environment_tags = {
    dev = {
      environment = "dev"
      costcenter  = "cc-dev"
      owner       = "dev-team"
    }
    qa = {
      environment = "qa"
      costcenter  = "cc-qa"
      owner       = "qa-team"
    }
    prod = {
      environment = "prod"
      costcenter  = "cc-prod"
      owner       = "platform-team"
    }
  }

  tags = merge(
    var.common_tags,
    lookup(local.environment_tags, var.environment, {})
  )
}
