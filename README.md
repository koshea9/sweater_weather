# Sweater Weather Description
> Sweater Weather is a backend application that allows users to see the current weather as well as the forecasted weather at their chosen destination. It is based on a service-oriented architecture, exposing API endpoints for the front-end teams use.

[![Build Status][travis-image]][travis-url]


## Learning Goals
* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Research, select, and consume an API based on your needs as a developer

## Versions
- Ruby 2.5.3

## Endpoint Examples
- [GET Background](https://github.com/koshea9/sweater_weather/blob/main/README.md#get-background)
- [GET Forecast](https://github.com/koshea9/sweater_weather/blob/main/README.md#get-forecast)
- [POST User Registration](https://github.com/koshea9/sweater_weather/blob/main/README.md#post-user-registration)
- [POST User Login](https://github.com/koshea9/sweater_weather/blob/main/README.md#post-user-login)
- [POST Road Trip](https://github.com/koshea9/sweater_weather/blob/main/README.md#post-road-trip)

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/5da3a4a7ec011046861c?action=collection%2Fimport)

#### GET Background

##### Resource URL
```
https://sweater-weather-ko.herokuapp.com/api/v1/backgrounds
```
Request Parameters:
| Request Parameter | Description | Required? |
| --- | --- | --- |
| **location** string | City and state | Yes - sent as header query|


Example Request:
```
https://sweater-weather-ko.herokuapp.com/api/v1/backgrounds?location=denver,co
```

Example Response:    
```json
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "image": {
                "location": "denver,co",
                "image_url": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?ixid=MnwyMzg5Mjd8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfDB8fHwxNjI0Mjk4ODM1&ixlib=rb-1.2.1"
            },
            "credit": {
                "source": "https://unsplash.com/@rdehamer",
                "author": "Ryan De Hamer"
            },
            "attribution": {
                "source": "https://unsplash.com/",
                "utm_source": "https://sweater-weather-ko.herokuapp.com",
                "utm_referral": "referral"
            }
        }
    }
}
```
#### GET Forecast

##### Resource URL
```
https://sweater-weather-ko.herokuapp.com/api/v1/forecast
```
Request Parameters:
| Request Parameter | Description | Required? |
| --- | --- | --- |
| **location** string | City and state | Yes - sent as header query|

Example Request:
```
https://sweater-weather-ko.herokuapp.com/api/v1/forecast?location=denver,co
```

Example Response:
   
```json
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-06-21T18:08:20.000+00:00",
                "sunrise": "2021-06-21T11:32:12.000+00:00",
                "sunset": "2021-06-22T02:31:21.000+00:00",
                "temperature": 62.19,
                "feels_like": 61.25,
                "humidity": 67,
                "uvi": 4.45,
                "visibility": 10000,
                "conditions": "overcast clouds",
                "icon": "04d"
            },
            "daily_weather": [
                {
                    "date": "2021-06-21",
                    "sunrise": "2021-06-21",
                    "sunset": "2021-06-22",
                    "max_temp": 73.27,
                    "min_temp": 53.98,
                    "conditions": "moderate rain",
                    "icon": "10d"
                },
                {
                    "date": "2021-06-22",
                    "sunrise": "2021-06-22",
                    "sunset": "2021-06-23",
                    "max_temp": 94.66,
                    "min_temp": 61.99,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-06-23",
                    "sunrise": "2021-06-23",
                    "sunset": "2021-06-24",
                    "max_temp": 95.29,
                    "min_temp": 69.48,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "date": "2021-06-24",
                    "sunrise": "2021-06-24",
                    "sunset": "2021-06-25",
                    "max_temp": 89.24,
                    "min_temp": 65.14,
                    "conditions": "moderate rain",
                    "icon": "10d"
                },
                {
                    "date": "2021-06-25",
                    "sunrise": "2021-06-25",
                    "sunset": "2021-06-26",
                    "max_temp": 65.37,
                    "min_temp": 58.66,
                    "conditions": "moderate rain",
                    "icon": "10d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "18:00:00",
                    "temperature": 62.19,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "19:00:00",
                    "temperature": 62.44,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "20:00:00",
                    "temperature": 64.38,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "21:00:00",
                    "temperature": 67.01,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "22:00:00",
                    "temperature": 70.14,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "23:00:00",
                    "temperature": 73.13,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "00:00:00",
                    "temperature": 73.27,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "01:00:00",
                    "temperature": 72.79,
                    "conditions": "broken clouds",
                    "icon": "04d"
                }
            ]
        }
    }
}
```
#### POST User Registration

##### Resource URL
```
https://sweater-weather-ko.herokuapp.com/api/v1/users
```
Request Parameters:
| Request Parameter | Description | Required? |
| --- | --- | --- |
| **email** string | Registering user's email | Yes - must be sent in body of request |
| **password** string | Password | Yes - must be sent in body of request |
| **password confirmation** string | Password confirmation | Yes - must be sent in body of request |


Example Request:
```json
{
  "email": "demouser2@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

Example Response:
    
```json
{
    "data": {
        "id": "4",
        "type": "users",
        "attributes": {
            "email": "demouser2@example.com",
            "api_key": "vC9iD8f3oDEPk6E-ftFO3w"
        }
    }
}
```
#### POST User Login

##### Resource URL
```
https://sweater-weather-ko.herokuapp.com/api/v1/users
```
Request Parameters:
| Request Parameter | Description | Required? |
| --- | --- | --- |
| **email** string | Registering user's email | Yes - must be sent in body of request |
| **password** string | Password | Yes - must be sent in body of request |

Example Request:
```json
{
  "email": "demouser2@example.com",
  "password": "password"
}
```

Example Response:

```json
{
    "data": {
        "id": "4",
        "type": "users",
        "attributes": {
            "email": "demouser2@example.com",
            "api_key": "vC9iD8f3oDEPk6E-ftFO3w"
        }
    }
}
```
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

## APIs Consumed
[Map Quest](https://developer.mapquest.com/documentation/geocoding-api/) - used for location information

[OpenWeather](https://openweathermap.org/api/one-call-api) - used for weather forecast

[Unsplash](https://unsplash.com/documentation) - used for background image 


<!-- Markdown link & img dfn's -->  
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.com/github/koshea9/sweater_weather
