resource "github_actions_environment_secret" "kubeconfig" {
  repository       = data.github_repository.repo.name
  environment      = github_repository_environment.repo_environment.environment
  secret_name      = "KUBE_CONFIG"
  plaintext_value  = file(var.kubeconfig_path)
}
