# GoBike app

## App in PRODUCTION : https://thpnext-gobike.herokuapp.com/

## Run it locally
 
Run further commands :

  - `git clone` this repos
  - `bundle install`
  - `rails db:create db:migrate`
  - `docker-compose -up`
  - `sidekiq`
  - `rails server`

## Instructions

Exercise gave by Denis Pasin ZARATAN during THP-NEXT training programme (The Hacking Project).

--> Rails App which evaluate the 5 vélib's closest stations from THP offices and free bikes available.

Pay attention to app optimization and so to :
  - tests
  - not to update all the database at each request to the API
  - optimize time for user

  - **bonus**: refresh button which refresh datas without page charging.
  - **extra bonus**: starting point adress specifing available.

## Use of

  - API url : http://api.citybik.es/v2/
  - Docker/Docker-compose
  - Husky (pre-commit, pre-push)
  - Rspec
  - Rubocop (relaxed-rubocop)
  - Sidekiq / Redis for background jobs
  - Gemset
  - Heroku for production app

Only one branch and no use of circle CI because this app is developped just by me for training, no team issues.

## To do / Working on progress

  - Make the search from adress (geocoder gem ?)
  - Tests to perform deeply and add of simplecov gem
  - Button for data refreshing without charging page (AJAX)
  - Map display (Leaflets and Mpabox)
  - Change distance calculation with Haversine formula to real route evaluation
  - Extend use for every town services of http://api.citybik.es/v2/
  - Time data post processing (KPI)
  - Add meteo API (openweathermap : https://openweathermap.org/)

## Thanks to

Thanks to http://api.citybik.es for open datas
