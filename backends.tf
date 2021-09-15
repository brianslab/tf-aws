terraform {
  backend "remote" {
    organization = "brianslab"

    workspaces {
      name = "aws-dev"
    }
  }
}