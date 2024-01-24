# declare variables here

variable "path_to_file1" {
  type = string
  default = "dir1/file1.txt"
}
variable "path_to_file2" {
  type = string
  default = "dir2/file2.txt"
}
variable "path_to_file3" {
  type = string
  default = "dir3/file3.txt"
}
variable "current_user" {
  type = string
  default = "anonymous"
}
variable "user_names" {
  type = list(string)
  description = "this is a list of strings"
  default = ["default_val1","default_val2","default_val3"]
}
variable "user_address" {
  type = list(string)
  description = "this is a list of adresses"
  default = ["default_ad1","default_ad2","default_ad3"]
}

variable "current_user_id" {
  type = number
  default =0
}
variable "user_address_map" {
  type = map(string)
  default = {
    user1="a"
    user2="b"
    user3="c"
  }
}

variable "user_designation_map" {
  type = map(string)
  default = {
    user1="a"
    user2="b"
    user3="c"
  }
}

variable "user_verified_map" {
  type = map(bool)
  default = {
   user1=true
    user2=false
    user3=true
  }
}
variable "user_LPA_map" {
  type = map(number)
  default = {
    user1=12
    user2=34
    user3=4
  }
}

variable "current_user_set_password" {
  type = bool
  default = false
}
variable "user_set_password_map" {
  type = map(bool)
  default = {
    user1=true
    user2=false
    user3=true
  }
}
# variable "user_object" {
#   type = object({
#     name    = string
#     LPA     = number
#     address = string
#     password = bool
#   })

#   default = {
#     name    = "John Doe"
#     LPA     = 30
#     address = "USA"
#     password = false
#   }
# }
variable "user_map_objects" {
  type = map(object({
    name    = string
    LPA     = number
    address = string
    password = bool
  }))
  default = {
    user1={
    name    = "joban"
    LPA     = 4
    address = "USA"
    password = false
    }
  }
  
}