# Kubernetes
locals {
  install = [for v in data.kubectl_file_documents.install.documents : {
    data : yamldecode(v)
    content : v
    }
  ]
  flux_vars = {
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