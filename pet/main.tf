variable "greeting" {}

resource "random_pet" "a_pet" {}

output "hello_pet" {
  value = "${var.greeting}, ${random_pet.a_pet.id}"
}
