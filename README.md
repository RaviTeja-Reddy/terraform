# terraform

Creating resource group and storage group using terraform.


Varibles.tf

Created varibles.tf file by declaring resource group name , 
storage group name , location to create resource and tags.

main.tf

Give azurerm as the source and configure all the vales written in
varibles.tf

To start deployment

 1- terraform init
 This is to inilitise the azurerm.

 2- terraform validate
 This is to check our writtten code is valid or not.

 3- terraform plan
 This is to see what our code is going to create or make changes.

 4- terraform apply 

 This is to start our code and create the resource-group and storage group from our code.
=======
 
