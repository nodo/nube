# nube
CLI to know the weather.

### Why?!
This is a weekend project to become more familiar with Perl.

### How to use it
Register and get an API key from https://openweathermap.org.

```
$ nube init                   # Initialise "nube", the tool will ask you to enter your API Key
$ nube now                    # Current weather in Amsterdam
$ nube now --location Dubai   # Current weather in Dubai

# Custom config location
$ nube init --config ~/.myconfig.yml
$ nube now --config ~/.myconfig.yml
```

### Why "nube"
"nube" means cloud in Spanish, given my current location it seemed appropriate. It also reminded me of "newbie", which is an accurate description of my Perl skills.
