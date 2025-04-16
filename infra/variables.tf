variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "SSH public key content"
  type        = string
  default     = ""
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key file"
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "environment" {
  description = "Environment (staging or production)"
  type        = string
  default     = "production"
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
  default     = "sfo3"
}

variable "backend_droplet_size" {
  description = "Size of the backend droplet"
  type        = string
  default     = "s-2vcpu-4gb"
}

variable "storefront_droplet_size" {
  description = "Size of the storefront droplet"
  type        = string
  default     = "s-2vcpu-4gb"
}

variable "repo_url" {
  description = "GitHub repository URL"
  type        = string
  default     = "https://github.com/backpack-fux/flowdose-ecomsystem.git"
}

variable "database_url" {
  description = "PostgreSQL connection URL"
  type        = string
  sensitive   = true
}

variable "redis_url" {
  description = "Redis connection URL"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "Domain name for the application (leave empty if not using custom domain)"
  type        = string
  default     = ""
}

variable "admin_email_for_certs" {
  description = "Email address for Let's Encrypt certificate notifications"
  type        = string
  default     = "admin@flowdose.xyz"
}

variable "jwt_secret" {
  description = "Secret key for JWT authentication"
  type        = string
  sensitive   = true
  default     = "yltngu81855enl52rx59dz590a29guap" # This is from .env.production but should be changed
}

variable "cookie_secret" {
  description = "Secret key for cookie encryption"
  type        = string
  sensitive   = true
  default     = "b6v2yh3c2qsh82f7559z4ovxlttpwitr" # This is from .env.production but should be changed
}

variable "postgres_host" {
  description = "PostgreSQL host"
  type        = string
}

variable "redis_host" {
  description = "Redis host"
  type        = string
} 