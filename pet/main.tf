resource "random_pet" "a_pet" {}

output "hello_pet" {
  value = "Hello ${random_pet.a_pet.id}"
}
