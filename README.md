### Flatiorn School: Seattle 0420 Cohort
# MovieShelf: Module 4 Project

### Description: 
This project was designed to enable a user to build and manage a library of movies using an external as well as local API. Through the tool a user can:

* Routing with React Router

![Pages](README_assets/pages_mvs.gif)

* Search movies from OMDB and add them to your shelf

![Search Movies](README_assets/add_mvs.gif)

* Handling of invalid search/can't find movie

![Search Error](README_assets/error_mvs.gif)

* View Movie Details

![Details](README_assets/details_mvs.gif)

* Filter movies on your shelf by genre

![Filter Genre](README_assets/filter_mvs.gif)

* See the default movie poster

![Default](README_assets/default_mvs.gif)

* Edit a movie's poster

![Edit Form](README_assets/edit_mvs.gif)

* Delete a movie

![Delete](README_assets/delete_mvs.gif)


The backend of the application leverages Ruby on Rails API functionality to receive and send AJAX requests in a JSON formate as well as an external API to receive movie information. The interactive frontend is built on ReactJS and React Bootstrap.

### Team:
* Colton Kaiser
* Justin Langlinais
* Joshua Mclean
* Trevor Low

### Dependencies:
* Developed on Google Chrome (80.0.3987.149)
* Ruby (2.6.1)
* RAILS (6.0.2.2)
* Bundler (2.1.4)
* PostgreSQL (12.3)

### Front End Dependencies
Refer to the frontend repo at ```https://github.com/jmclean-coder/MovieShelfFE``` for instructions to set up the front-end interface and ReactJS

### Installation:

Download this entire git repository to your computer and place in your desired install directory. If you don't have the above dependencies, in your terminal run `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"` to install Homebrew, then run `brew install rbenv ruby-build` to install Ruby, then `rbenv install 2.7.1` `rbenv global 2.7.1` and `ruby -v` to confirm. Finally, to install Rails, run `gem install rails -v 6.0.2.2` `rbenv rehash` and `rails -v` to confirm. If you need to install PostgreSQL, follow their instructions here: https://postgresapp.com/.

Via a terminal interface navigate to ```install_directory/frontend```. From this location execute ```bundle install``` to install all other required gem packages. 

### External API Setup - Backend/Seeding your Database
Seeding your database with test data is partially setup for you. This requires the setup of the Rapid API Movie Database with your own personal key. Visit ```https://rapidapi.com/rapidapi/api/movie-database-imdb-alternative``` to obtain a key and test your endpoints.
Once you have your key, navigate to the root directory of the project (MOVIESHELF-BACKEND) and check the gem file for ```gem 'figaro'``` this should have installed when you ran bundle install in the previous steps. Now run ```bundle exec figaro install```. This will create an ```application.yml``` file in your project root directory /config. This file will automatically be added to the .gitignore. In this file type and save: ```movDb_api_key: 'yourapikey'```. Double check the app/adapters/movie_database.rb file to make sure the string matches what you typed before the colon in the application.yml file.

In App.js on line 10, notice that the URL is being passed the api key via the environment variable, instead of it be hard-coded in. To maintain security, be sure to use the environment varible to refer to your key anywhere you use it.

### Running:
This project was designed as a proof of concept so it requires hosting locally. To start hosting the local server, start by opening PostgreSQL and starting the server. Then, in your terminal navigate to the directory you've installed this repo in. (note: You must complete External API Setup before seeding your database!) Once there, execute `rails db:migrate`,`rails db:seed`, and finally ```rails s```. The rails server is functioning solely as a backend API for local development, so you do not need to navigate to localhost:3000 in your browser unless you'd like to test to make sure the database is running correctly. It's recommended to run the backend on port 3000 then the front end on a different port.

### License
Copyright 2020 Colton Kaiser, Joshua Mclean, Justin Langlinais, Trevor Low

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
