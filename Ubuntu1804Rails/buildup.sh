#! /bin/bash
sudo apt-get update
sudo apt-get install -y httpd
sudo apt-get install ruby node yarm

sudo gem install rails

sudo chkconfig httpd on
sudo service httpd start
echo "<h1>hello world</h1>" | sudo tee /var/www/html/index.html