variable "organization" {
  type = object({
    id = number,
    name = string
  })
  description = "(required) Organization id and name"
}
