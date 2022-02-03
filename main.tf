# Kubernetes
resource "kubernetes_namespace" "flux_system" {
  metadata {
    name = var.flux_namespace
  }
}

resource "kubectl_manifest" "install" {
  for_each   = { for v in local.install : lower(join("/", compact([v.data.apiVersion, v.data.kind, lookup(v.data.metadata, "namespace", ""), v.data.metadata.name]))) => v.content }
  yaml_body  = each.value
  depends_on = [kubernetes_namespace.flux_system]
}

resource "kubectl_manifest" "flux" {
    for_each  = data.kubectl_file_documents.flux.manifests
    yaml_body = each.value
    depends_on = [kubernetes_namespace.flux_system]
}