resource "local_file" "this" {
  content  = "My Name is Jonathan"
  filename = "${path.module}/john.txt"
}


resource "local_file" "just" {
  content  = "My Name is Catherine"
  filename = "${path.module}/cat.txt"
}
