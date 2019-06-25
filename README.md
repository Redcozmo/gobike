## GoBike app

# App in PRODUCTION : https://thpnext-gobike.herokuapp.com/

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

## Working on progress

- make the search from adress (geocoder gem ?)
- tests to perform deeply and add of simplecov gem
- button to data refreshing without charging page (AJAX ?)
- map display (Leaflets and Mpabox)
- extend use for every town services of http://api.citybik.es/v2/
- time data post processing (KPI)
- add meteo API (openweathermap : https://openweathermap.org/)

## Thanks to

Thanks to http://api.citybik.es for open datas
