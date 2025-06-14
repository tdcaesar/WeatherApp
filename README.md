# Weather App

## Overview

This app originated as a training project to learn SwiftUI.  It is a very simple app that uses the GPS to determine your location, passes your location to discover the closest NOAA weather station, and pulls the latest weather forecast from the selected NOAA station.  

## What's Next

The plan is to divide the project into a series segments illustrating the incremental building of features.  

## Data Sources

There are two datasources covered in this application, Open Weather and NOAA.  Open Weather has a superior API but comes at a cost.  NOAA is free but has an inferior though still very useful API.  This application is using NOAA as it's primary source for now.  

### Open Weather API

Open Weather has a well designed API with versioning.  They have multiple endpoints available for various ranges and granularity of weather information.  They also have a number of historical data and special data types and services.  The data is easy to work with and consistent.  You can retrieve data simply with latitude and longitude or city name in one query and the query syntax gives options for units of measure and other useful details.  The catch is an account is required and the better data sets require a paid subscription.  

At the time of this writing, you can get the current weather and a 5 day forecast with three hour increments for free. The more useful hourly forecasts and 16 day daily forecast require a subscription.  There is a free option for students and a pay as you go subscription with a generous cap and low cost per transaction over the cap.  A student account will require a student ID.  The pay as you go subscription includes 1000 transactions per month and could be useful as a developer experimenting.  However, if you write a public or high use app, you'll need a higher level subscription.  

Open Weather does not include icons.  

### NOAA API

NOAA has a well documented API but without versioning as near as I can tell. There are multiple endpoints available for various ranges and granularity of weather information.  The data is not easy to work with and requires multiple queries and transformations to get the data needed for the application.  For example, to pull weather data, you need the NOAA forecast office ID and Grid coordinates.  This means you'll need to first query your latitude and longitude to determine your closest forecast office before you can query the weather data. However, the API is free for all with many features and does not require an account.  

NOAA includes online icons but they are very bad picture images and not true weather icons.  

### Weather Underground

Weather Underground has an extensive network of citizen weather stations providing tons of localized data.  The API is well documented and has multiple endpoints with useful information.  It appears to be straightforward to work with though I have not integrated it into the application.  The downside is it has a heavy paywall. 

The API requires and account and subscription.  There is a free trial but the trial only lasts for 30 days.  At the time of this writing, the minimum subscription option is $500 USD/month.  Cost prohibitive for me, so I won't be experimenting with this API or if I do it will only be short term during a trial.  

Open Weather does include decent weather icons.  

### Weather API 

Weather API has a free option but has limitations 3 days of forecasts and 7 days of historical data.  A subscription is required to use the API. 

### Open-Meteo

Open-Meteo has a free option for non-commercial use that doesn't have any limitations on the APIs available beyond the number of transactions.  


## References

[](https://designcode.io/quick-apps-swiftui-weather-app-1)
[](https://github.com/stephdiep/WeatherApp/blob/main/WeatherApp/Views/ContentView.swift)
[NOAA API Documentation](https://www.weather.gov/documentation/services-web-api)
[OpenWeather API Documentation](https://openweathermap.org/api)
[Weather Underground API](https://developer.weather.com)
[Weather API](https://www.weatherapi.com/api-explorer.aspx)
[Open-Meteo](https://open-meteo.com/en/docs)
