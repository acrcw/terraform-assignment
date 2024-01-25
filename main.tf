
resource "local_file" "file1" {
  filename = "${path.module}/${var.path_to_file1}" # path to file
  content  = <<-EOT
    This file contains Info about current user
    current_user = "${var.current_user_id}"
    current_user_name = "${var.current_user}"

    

   


   
  EOT
}
resource "local_file" "file2" {
  filename = "${path.module}/${var.path_to_file2}" # path to file

  content = <<-EOT
    This file contains Info about all the users
    List of all the users: ${join(", ", var.user_names)}
    List of all the users addresses: ${join(", ", var.user_address)}
    
    Content of user_object_list
    ${join("\n", [for i, user in var.user_object_list : "ID: ${random_id.user_id_generator[i].hex}, Name: ${user.name}, LPA: ${user.LPA}, Address: ${user.address}, Password: ${random_password.user_password[i].result}"])}
   
    


   
  EOT
}
resource "local_file" "file3" {
  filename = "${path.module}/${var.path_to_file3}" # path to file
  content  = <<-EOT
    This file contains Info of the all maps used in the this project
  
    map of user address:
    ${join("\n", [for k, v in var.user_address_map : "${k} = ${v}"])}
    map of user_designation_map:\n
    ${join("\n", [for k, v in var.user_designation_map : "${k} = ${v}"])}
    map of user address:\n
    ${join("\n", [for k, v in var.user_LPA_map : "${k} = ${v}"])}
    map of user address:\n
    ${join("\n", [for k, v in var.user_set_password_map : "${k} = ${v}"])}
    map of user address:\n
    ${join("\n", [for k, v in var.user_verified_map : "${k} = ${v}"])}
  EOT
}



resource "random_id" "user_id_generator" {
  count       = length(var.user_object_list)
  byte_length = 8
}

locals {
  current_user_id       = random_id.user_id_generator[0].hex
  current_user_nickname = var.current_user
  current_user_password = random_password.user_password[0].result
}

resource "random_password" "user_password" {
  count   = length(var.user_object_list)
  length  = 16
  special = true
}