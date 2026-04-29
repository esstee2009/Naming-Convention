variable "rg" {
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))

  validation {
    condition = alltrue([
      for rg in var.rg :
      can(regex("^rg-[a-z0-9]+-(dev|test|prod)-uksouth$", rg.rg_name))
    ])
    error_message = "Each rg_name must follow: rg-<project>-<env>-uksouth (lowercase only, env: dev/test/prod)"
  }
}