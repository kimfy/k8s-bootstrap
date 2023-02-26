apiVersion: v1
kind: Config
clusters:
- name: kind
  cluster:
    server: ${K8S_API_URL}
users:
- name: bootstrapper
  user:
    token: ${TOKEN}
contexts:
- name: default
  context:
    cluster: kind
    user: bootstrapper
current-context: default
