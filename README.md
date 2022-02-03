# Flux install module
Terraform module to install FluxCD V2

## Dependencies
Create ssh keypair and add and add to your git repo and keep it in a safe place.
```shell
export MY_CLUSTER="your-cluster-name"
ssh-keygen -t ed25519 -C $MY_CLUSTER -f identity
```

Import known hosts from your git provider
GitHub
```shell
export MY_PROJECT_PATH="your/project/path"
ssh-keyscan -H github.com >> $MY_PROJECT_PATH/known_hosts
```

GitLab
```shell
export MY_PROJECT_PATH="your/project/path"
ssh-keyscan -H gitlab.com >> $MY_PROJECT_PATH/known_hosts
```

BitBucket
```shell
export MY_PROJECT_PATH="your/project/path"
ssh-keyscan -H bitbucket.org >> $MY_PROJECT_PATH/known_hosts
```


# Usage
Basic usage of the module as follows:
```terraform
module "flux-install" {
  source  = "rafaelperoco/flux-install/flux"
  version = "0.0.3"

  target_path = var.target_path
  gitrepository = var.gitrepository
  gitrepo_url = var.gitrepo_url
  gitbranch = var.gitbranch
  interval = var.interval
  identity_file = var.identity_file
  identity_pub_file = var.identity_pub_file
  known_hosts_file = var.known_hosts_file
}
```

terraform.tfvars
```terraform
target_path = "cluster"
flux_manifests = "cluster"
identity_file = "identity"
identity_pub_file = "identity.pub"
known_hosts_file = "known_hosts"
gitrepo_url = "ssh://git@github.com/your-username/my-cluster-with-flux.git"
gitrepository = "my-cluster-with-flux"
interval = "1m0s"
gitbranch = "main"
```