resource "local_file" "file1" {
  filename = "${path.module}/dir1/file1.txt"# path to file
  content = "The value of number variable =${var.number_1} "
}
resource "local_file" "file2" {
  filename = "${path.module}/dir2/file2.txt"# path to file
  content = 
}
resource "local_file" "file3" {
  filename = "${path.module}/dir3/file3.txt"# path to file
  content = "This is the content of the file 3"
}