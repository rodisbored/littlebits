# README

This project was setup using MySQL 5.6. It may work with MySQL 5.7, but that hasn't been tested locally.

Ruby 2.4.0 must be installed on the system to ensure correct operation. Since Ruby is backwards
compatible to a certain extent, other Ruby versions will probably work, but are not guaranteed.


## Installation

To install and run this project, execute the following commands each on their own line within the project
root directory

```
bundle install
bundle exec rake db:create && bundle exec rake db:migrate
bundle exec rails s
```

The littlebits-ui will need to be downloaded to interact with this backend which can be obtained
[here](https://github.com/rodisbored/littlebits-ui).

