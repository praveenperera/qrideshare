## Synopsis

Qrideshare is a platform for Queen's University students to share rides between their homes and Queen's University in Kingston ON. This project is currently in currently in a very early alpha stage. Front end was designed using the bootstrap framework.

Currently the project is very simple, users are able to sign up and post a ride with information such as when and where they are leaving from and going to. Once posted other users can request a seat. If the driver accepts the person as a passenger, they will be added to the ride and the posted ride will show one less available spot.

This project also lets users communicate with each other with a email type messaging system. This system was built using the [mailboxer gem](https://github.com/mailboxer/mailboxer). Additional methods were added into the messaging and conversation controllers for added functionality. Currently users can send messages to each other from links in the requests page or if they know the users's username (the email that they signed up with).

There are plans to expand this platform to other universities as well.

### Live Demo
Live demo available at: https://qrideshare.herokuapp.com



## Contributors

Currently I am the only contributor to the project, additional contributors are welcome.

1. Fork it ( https://github.com/[my-github-username]/qrideshare/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

Please also use Github issue tracker to show what you plan doing and provide tests and documentations whenever possible



## How to Contribute

As stated before this is a very early proof of concept version, many additions and changes need to be made. Including:

* Validations need to added and updated
* Documentation improvements
* Tests need to be added
* Code refactoring and clean ups need to be made
* Should fork mailboxer gem and move the additional methods into the gem
* About and Terms and Conditions pages need to be added
* Unread notifications need to be added to messages and ride requests
* Email notifications need to be set up via mandrill


###Additional Features

Also in the future I am planning on adding the following features:

* Real time chat integrated with current messaging system
* Expand platform to accept sign ups from other universities
* Add payment system so users can pay for rides upfront, or use Uber style payment where the payment is sent once they arrive at a set location (home or school)
* Driver and passenger review system needs to be added so users can rate each other and the ride
* User reporting and banning system should also be added

## Motivation

The motivation for this project comes from solving a problem I have personally had. I graduated from Queen's University last year. Queen's university is 3 hours away from Toronto. Many student's hometowns are either Toronto or another city in the Toronto area.

So far these students have been using a ride-share group on Facebook to organize rides. This platform was created to solve some of the problems involved with using Facebook to organize ride-shares including:

* Unsure if the ride is still available or full
* No good way to keep passengers and drivers accountable (solved with review system)
* No good way to search for rides
* Many students no longer use Facebook


## Installation

This repo is the full rails app for qrideshare you can choose to fork and edit it and use it however you wish. Currently uses postgresql as default database, this can be changes.

Download the repo, navigate to the folder via terminal and run bundle install to get the necessary gems, create the db and run migrations. Finally run start the server.

 ```shell
 bundle install
 rake db:create
 rake db:migrate
 rails s
 ```


## License

Qrideshare is under MIT license - http://www.opensource.org/licenses/mit-license.php

