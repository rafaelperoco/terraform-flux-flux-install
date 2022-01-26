# Flux
data "flux_install" "main" {
  target_path      = var.target_path
  components_extra = var.components_extra
}

# Kubernetes
data "kubectl_file_documents" "install" {
  content = data.flux_install.main.content
}