resource "github_repository_environment" "repo_environment" {
  repository       = data.github_repository.repo.name
  environment      = var.github_repository_environment
}

