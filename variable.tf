# declare variables here

variable "path_to_file1" {
  type    = string
  default = "dir1/file1.txt"
}
variable "path_to_file2" {
  type    = string
  default = "dir2/file2.txt"
}
variable "path_to_file3" {
  type    = string
  default = "dir3/file3.txt"
}
variable "current_user" {
  type    = string
  default = "anonymous"
}


variable "current_user_id" {
  type    = number
  default = 0
}
variable "current_user_set_password" {
  type    = bool
  default = false
}

variable "user_object_list" {
  type = list(object({
    name        = string
    CTC         = number
    address     = string
    password    = string
    verified    = bool
    designation = string
    skills      = list(string)
    details     = map(string)
    manager=string
  }))

  default = [{
    name        = "John Doe"
    CTC         = 30
    address     = "USA"
    password    = "default"
    verified    = false
    designation = "Trainee"
    skills      = ["##", "###"]
    details = {
      "role" = "value"
      "role" = "value"
      "role" = "value"
    }
    manager = "value"
  }]
}
