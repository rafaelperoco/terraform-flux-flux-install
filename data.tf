# Flux
data "flux_install" "main" {
  target_path      = var.target_path
  components_extra = var.components_extra
}

data "template_file" "flux_apply" {
  template = file("${path.module}/templates/flux.tftpl")
  vars = {
    gitrepository     = var.gitrepository
    gitbranch         = var.gitbranch
    gitrepo_url       = var.gitrepo_url
    interval          = var.interval
    namespace         = var.namespace
    flux_manifests    = var.flux_manifests
    identity_file     = trimspace(file(abspath(pathexpand(var.identity_file))))
    identity_pub_file = trimspace(file(abspath(pathexpand(var.identity_pub_file))))
  }
}

# Kubernetes
data "kubectl_file_documents" "install" {
  content = data.flux_install.main.content
}


data "kubectl_file_documents" "flux" {
    content = data.template_file.flux_apply.rendered
}