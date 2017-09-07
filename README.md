# README

### Clone:

```
git clone https://github.com/marlonmarcos21/url_shortener.git
```

### Setup:

* Execute bundle install:

```
bundle install
```

* Setup Database (App is using postgres, change to your preferred database if needed)

```
bundle exec rake db:setup
```

* Create `.env` file

```
cp .env.example .env
```

* Create google API key [here](https://console.developers.google.com/apis/credentials)

* Set google api key in your `.env` file
