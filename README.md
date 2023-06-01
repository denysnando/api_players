## About

Hi, This project is a back-end api which implements
  - Players crud
  - Notifications crud
  - Subscribe information for players

## Technologies/prerequisites

This project was developed with the following technologies:

* Ruby `3.1.2` - You can use [ASDF](https://asdf-vm.com/guide/getting-started.html)
* PostgreSQL 14
  * OSX - `$ brew install postgresql` or install [Postgress.app](http://postgresapp.com/)
  * Linux - `$ sudo apt-get install postgresql`
  * Windows - [PostgreSQL for Windows](http://www.postgresql.org/download/windows/)
* Bundler `2.3.21`

## Usage
After you get all the [prerequisites](#prerequisites), simply execute the following commands in sequence:

1. `gem install pg -v '1.1.4'`
2. `bundle`
3. `bundle exec rake db:create`
4. `bundle exec rake db:migrate`

You can run a rake to populate the database with information from the player api

- `rake players:create_players`

## INFO

A [documentation/collection](https://documenter.getpostman.com/view/454703/2s93mBvdnF#e2a8bbc6-5ac9-4f3a-80e1-dd1864091d82) was created in postman to help with endpoints
where basically the endpoints are:

- Internal access to show, create and edit players
1. GET `/internal/v1/players` 
2. POST `/internal/v1/players`
3. PUT `/internal/v1/players/:id`

- Internal access to show, create and edit notifications:
1. GET `/internal/v1/notifications`
2. POST `/internal/v1/notifications`
3. PUT `/internal/v1/notifications/:id`

- And external acces to get players and create a subscribe
1. GET `/external/v1/players`
2. POST `/external/v1/subscribe`

---

There is a scheduler to clean Notifications older than a week, you can check it by looking at the archive.

- `config/schedule.yml`

---------------------

### To run the tests:

- `coverage=on rspec`

and you can get coverage after:

`open coverage/index.html`

By the way about coverage: 

![image](https://github.com/denysnando/api_players/assets/3411874/dbaae846-6c28-4dd1-ba4e-23bf3047a9a2)



# TODO

- Write documentation with Swagger
- Add docker
- add authentications on API


--- 
Thanks for the opportunity, this was made with ♥&nbsp;by denysnando :wave:&nbsp; [Get in touch!](https://www.linkedin.com/in/%F0%9F%91%8B-denys-santos-a5929823/)
