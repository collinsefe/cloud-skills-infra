Assignments:

Goto ec2.tf

create a new ec2 instance for yourself

Log into the ec2 instance from the console

sudo yum update
sudo yum install docker -y
sudo systemctl docker start
mkdir docker 
cd docker 
vi dockerfile
vi 1.html

sudo docker build -t yourname/apache .
sudo docker run -d -it -p 88:80 yourname/apache

go and check on the browser 
- public_ip_address:88
- public_ip_address:88/1.html
if the page loads successfully, then push the image to docker hub

docker login
docker push -t yourname/apache

The end - Congratulations !!!