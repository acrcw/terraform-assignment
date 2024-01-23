# declare variables here

variable "string_1" {
  type = string
  description = "this is a string variable"
  default = "default value for string_1"
}

variable "number_1" {
  type = number
  description = "this is a number variable"
  default = 0
}
variable "list_string_1" {
  type = list(string)
  description = "this is a list of strings"
  default = ["default_val1","default_val2","default_val3"]
}
variable "map_string_1" {
  type = map(string)
  description = "this is a map of strings"
 
}
variable "map_string_2" {
  type = map(string)
  description = "this is a map of strings"
  default = {
    key1  = "default"
    key2  = "default"
    key3 = "default"
  }
}