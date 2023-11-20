variable "organization" {
  type = object({
    id = number,
    name = string
  })
  description = "(required) Organization id and name"
}

variable "optOutPolicy" {
  default = {
    services = {
      default = {
        opt_out_policy = {
          "@@assign" = "optOut"
        }
      }
    }
  }
  type = any
  description = "(optional) SCP optOut default"
}