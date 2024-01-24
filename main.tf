
resource "local_file" "file1" {
  filename = "${path.module}/${var.path_to_file1}"# path to file
  content = "${var.current_user} "
}
resource "local_file" "file2" {
  filename = "${path.module}/${var.path_to_file2}"# path to file
  content = "This is the content of the file 2"
}
resource "local_file" "file3" {
  filename = "${path.module}/${var.path_to_file3}"# path to file
  content = "This is the content of the file 3"
}



resource "random_id" "user_id_generator" {
   byte_length = 8
}

locals {
  current_user_id=random_id.user_id_generator.hex
}
