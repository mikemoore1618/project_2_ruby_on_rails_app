![alt text](https://i.imgur.com/PuF8jvJ.png)

https://peaceful-sea-29225.herokuapp.com/

This app aims solve to Spotify's clunky "Friend Activity" section and make it easier to check out what your friends are listening to and post songs youre currently groovin' too!

# Tech

* Ruby on Rails (Ruby version 2.5.0)

* Postgresql

* Bcrypt

* Bootstrap

* HTML

* CSS/SASS
    
    
# Installation/Startup
    
* The first step is to download this directory from Github to a local directory on your computer.

* Open Terminal 

* Open the project directory and type: bundle install      -(This installs gems you need for the app)

* Make sure you have Postgres, if not download from the Postgres website. 

* Then, initiate a Postgres local server

* Open a new terminal tab and make sure you are not in Postgres or have a rails server open in that tab.

* Type: rails run rake db:migrate 
    -(this will migrate the app's tables)

* Type: rails server. 
    -(This will initiate your server)

* Open a new tab on your browser and type in localhost:3000
    -(If you get an error or a different application, make sure you do not have a previous local server running in a separate terminal tab.)

* Start using/updating the app to help pets and people in your area!

# Initial Idea

![alt text](https://i.imgur.com/ccm0WQJ.jpg)

# Back log

-  Create a third Model for Comments on Posts from Users with full CRUD
-  Implement functionality for Likes on Posts from Users with Create and Delete
-  Add Genre feild to Posts Model and add Sort By Genre Functionality
-  Gain ponsorship and a 6 figure salary from Spotify

# Trello

https://trello.com/b/Hm4YN7rd/wdi-58-project-2-full-stack-ruby-app#
