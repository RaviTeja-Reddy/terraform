# terraform

Creating resource group using terraform


Varibles.tf

Created varibles.tf file by declaring resource group name , 
location to create resource and tags.


locals.tf

created locals.tf file and add derived varibles in it.


Output.tf

created output.tf and specified the value for the resource group to 
be displayed.
Give Sensitive=True beacuse to hide the name in the code.

main.tf

Give azurerm as the source and configure all the vales written in
varibles.tf , locals.tf , output.tf

To start deployment

 1- terraform init
 This is to inilitise the azurerm.

 2- terraform validate
 This is to check our writtten code is valid or not.

 3- terraform plan
 This is to see what our code is going to create or make changes.

 4- terraform apply 

 This is to start our code and create the resource-group from our code.
=======
 