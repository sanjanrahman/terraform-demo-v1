# sanjan-terraform-demos: Generate pub key
From your local machine where ever you stored your .pem key open that and copy the key.
Go to ~/.ssh in your EC2 Server.
Do a ls command see if there is any .pub key.
if not follow instruction on https://jee-appy.blogspot.com/2018/07/create-aws-infrastructure-with-terraform.html.
# Create public key
Copy the key from your local and paste it in EC2 server ~/.ssh path in a file (name the file same: sanjan_dev_vpc.pem.
Generate public key from private key.
Run following command.
ssh-keygen -y -f ~/.ssh/sanjan_dev_vpc.pem.
After running the command you will get a sanjan_dev_vpc.pub.
look at resource.tf file how the sanjan_dev_vpc.pub added as interpolation. (I renamed the pub key as terraform.pub)
#After you do terraform init run the following command to re use the key (I added the following to userdata.sh 
"terraform import aws_key_pair.terraform terraform"

