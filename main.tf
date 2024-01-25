
resource "local_file" "file1" {
  filename = "${path.module}/${var.path_to_file1}" # path to file
  content  = <<-EOT
    This file contains Info about current user using locals
    current_user = "${local.current_user_id}"
    current_user_nickname = "${local.current_user_nickname}"
    current_user_set_password = "${local.current_user_password}
  EOT
}
resource "local_file" "file2" {
  filename = "${path.module}/${var.path_to_file2}" # path to file

  content = <<-EOT
    This file contains Info about all the users
    Content of user_object_list
    ${join("\n", [for i, user in var.user_object_list: "\nID: ${random_pet.CEQ_id_generator[i].id}_${random_id.user_id_generator[i].hex},\nName: ${user.name},\nLPA: ${user.CTC},\nAddress: ${user.address},\nPassword: ${random_password.user_password[i].result}  ,\nVerified: ${user.verified} ,\nManager: ${user.manager} ,\nDesignation: ${user.designation} \nSkills: ${join("\t, ", user.skills)}\nDetails:\n${join("\n", [for k, v in user.details : "  ${k}: ${v}"])}"])}

  EOT
}
resource "local_file" "file3" {
  filename = "${path.module}/${var.path_to_file3}" # path to file
  content  = join("\n\n", local.formatted_user_details)
}



resource "random_pet" "nickname_generator" {
  count=length(var.user_object_list)
  length = 1
  prefix = "CEQ"
}
resource "random_pet" "CEQ_id_generator" {
  count=length(var.user_object_list)
  length = 1
  prefix = "CEQ"
  separator = "_"
}
resource "random_id" "user_id_generator" {
  count       = length(var.user_object_list)
  byte_length = 8
}

locals {
  current_user_id       = random_id.user_id_generator[0].hex
  current_user_nickname = var.current_user
  current_user_password = random_password.user_password[0].result
  formatted_user_details = [for i,user in var.user_object_list : <<-EOT
    User Details for ${user.name}:
    Name: ${user.name}
    CTC: ${user.CTC}
    NickName: ${random_pet.nickname_generator[i].id}
    Address: ${user.address}
    Password: ${user.password}
    Verified: ${user.verified}
    Designation: ${user.designation}
    Skills: ${join(", ", user.skills)}
    Details:
      ${join("\n", [for k, v in user.details : "${k}: ${v}\n"])}
  EOT
  ]
}

resource "random_password" "user_password" {
  count   = length(var.user_object_list)
  length  = 16
  special = true
}