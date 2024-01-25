output "path_of_file1" {
  value = var.path_to_file1
}
output "path_of_file2" {
  value = var.path_to_file2
}
output "path_of_file3" {
  value = var.path_to_file3
}
output "user_id" {
  value = local.current_user_id
}
output "current_user_nickname" {
  value = local.current_user_nickname
}
output "current_user_password" {
  value = local.current_user_password
  sensitive = true
}
output "user_names_list" {
  value = var.user_names
}
output "user_address_list" {
  value = var.user_address
}
output "user_address_map" {
  value = var.user_address_map
}
output "user_designation_map" {
  value = var.user_address_map
}
output "user_LPA_map" {
  value = var.user_LPA_map
}
output "user_set_password_map" {
  value = var.user_set_password_map
}
output "user_verified_map" {
  value = var.user_verified_map
}
output "current_user_set_password" {
  value = var.user_set_password_map
}
output "user_object" {
  value = var.user_object_list
}
