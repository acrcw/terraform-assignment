
resource "local_file" "file1" {
  filename = "${path.module}/${var.path_to_file1}"# path to file
  content = <<-EOT
    This file contains Info about current user
    current_user = "${var.current_user}"
    current_user_id = "${var.current_user_id}"

    Example List: ${join(", ", var.user_address)}
    Example List: ${join(", ", var.user_names)}

    Example Map:
    ${join("\n", [for k, v in var.user_set_password_map : "${k} = ${v}"])}


   
  EOT
}
resource "local_file" "file2" {
  filename = "${path.module}/${var.path_to_file2}"# path to file
  
  content = <<-EOT
    This file contains Info about all the users
    List of all the users: ${join(", ", var.user_names)}
    List of all the users addresses: ${join(", ", var.user_address)}

    


   
  EOT
}
resource "local_file" "file3" {
  filename = "${path.module}/${var.path_to_file3}"# path to file
  content = <<-EOT
    This file contains Info of the all maps used in the this project
  

    Map:
     ${join("\n", [for k, v in var.user_set_password_map: "${k} = ${v}"])}


   
  EOT
}



resource "random_id" "user_id_generator" {
   byte_length = 8
}

locals {
  current_user_id=random_id.user_id_generator.hex
  current_user_nickname=var.current_user
  current_user_password=random_password.user_password.result
}

resource "random_password" "user_password" {
  length           = 16
  special          = true
}