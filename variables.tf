variable "target_path" {
  type        = string
  description = "flux install target path"
}

variable "components_extra" {
  type        = list(string)
  default     = []
  description = "extra flux components"
}

variable "flux_namespace" {
  type        = string
  default     = "flux-system"
  description = "flux namespace"
}

variable "gitrepository" {
  type        = string
  description = "git repository"
}

variable "gitbranch" {
  type        = string
  default     = "main"
  description = "git branch"
}

variable "namespace" {
  type        = string
  default     = "flux-system"
  description = "flux namespace"
}

variable "flux_manifests" {
  type        = string
  description = "flux manifests"
}

variable "interval" {
  type        = string
  default     = "1m0s"
  description = "interval"
}

variable "identity_file" {
  type        = string
  description = "ssh identity file"
}

variable "identity_pub_file" {
  type        = string
  description = "ssh identity pub file"
}

variable "known_hosts_file" {
  type        = string
  description = "ssh known hosts file"
}

variable "gitrepo_url" {
  type        = string
  description = "git repo url"
}