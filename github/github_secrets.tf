data "github_repository" "repo" {
  full_name = var.github_repository_name
}

resource "github_repository_environment" "repo_environment" {
  repository       = data.github_repository.repo.name
  environment      = var.github_repository_environment
}

resource "github_actions_environment_secret" "kubeconfig" {
  repository       = data.github_repository.repo.name
  environment      = github_repository_environment.repo_environment.environment
  secret_name      = "KUBE_CONFIG"
  plaintext_value  = file(var.kubeconfig_path)
}
