# Sweater Weather Description
> Sweater Weather is a backend application that allows users to see the current weather as well as the forecasted wather at their chosen destinatation. It is based on a service-oriented architecture, exposing API endpoints for the front-end teams use.

[![Build Status][travis-image]][travis-url]


## Learning Goals
* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Research, select, and consume an API based on your needs as a developer

## Versions
- Ruby 2.5.3

## Usage example

#### POST Road Trip

##### Resource URL
```
https://sweater-weather-ko.herokuapp.com/api/v1/road_trip
```
Request Parameters:
| Request Parameter | Description | Required? |
| --- | --- | --- |
| **api_key** string | API key provided after registration | Yes - must be sent in body of request |
| **origin** string | City and state where road trip begins | Yes - must be sent in body of request |
| **destination** string | City and state where road trip ends. Must be sent in body of request. | Yes - must be sent in body of request |

Example Request:
```json
{
  "origin": "Denver,CO",
  "destination": "New York, NY",
  "api_key": "PvMs2mOvDYWwEIs_dNGLLQ"
}
```

Example Response:
```json
{
    "data": {
        "id": null,
        "type": "road_trip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "New York, NY",
            "travel_time": "26:16:46",
            "weather_at_eta": {
                "temperature": 74.08,
                "conditions": "clear sky"
            }
        }
    }
}
```

## Development setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Add protected storage for API keys using installed [figaro gem](https://github.com/laserlemon/figaro): `bundle exec figaro install`
6. Add your API keys to the `config/application.yml` file (links to obtain below)

``` ruby
# config/application.yml

mapquest_consumer_key: <your api key here>
mapquest_consumer_secret: <your api key here>

open_weather_api_key: <your api key here>

unsplash_access_key: <your api key here>
unsplash_secret_key: <your api key here>
```
6. Run test suite with `bundle exec rspec`

## APIs 
[Map Quest](https://developer.mapquest.com/documentation/geocoding-api/)

[OpenWeather](https://openweathermap.org/api/one-call-api)

[Unsplash](https://unsplash.com/documentation)



<!-- Markdown link & img dfn's -->  
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.com/github/koshea9/sweater_weather
[wiki]: https://github.com/yourname/yourproject/wiki
