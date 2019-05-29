# GiphyAPI

[![codebeat badge](https://codebeat.co/badges/fc671989-7aeb-4b3b-a5fb-9d918fcd0e54)](https://codebeat.co/projects/github-com-descorp-giphyapi-master)

Framework to access Giphy API + Gipty App

## Structure

Solution spited into 3 projects

### ApiProvider

Basic API acceess helper labrary.
Provide fast-to-develop and secure access to any API 

### GiphyApiProvider

Extendable HTTPs client. SSL certificates to Giphy API pinned. 90% test coverage

### Giphy Demo iOS app 

MVC+coordinator architecture with dependency injection. 
Shows infinit list of tranding gifs. On tap shows high resolution preview and slide to a random gif every 10 second.
Images cached.
 
#### Overview


## How to run

* clone solution
* replace {API_KEY} in config.info with your API Key
* Run the app

## Todo

1. Add UI Tests for Giphy Demo App
2. Add transition animation

## Credits

<img src="https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif" alt="Powered by The Giphy" width="150">
