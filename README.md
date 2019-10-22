# OmniAuth Smile

Smile OAuth2 Strategy for OmniAuth 1.0.

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-smile'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::Smile` is simply a Rack middleware. Read [the OmniAuth 1.0 docs](https://github.com/intridea/omniauth) for detailed instructions.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :smile, ENV['SMILE_CLIENT_ID'], ENV['SMILE_CLIENT_SECRET']
end
```
## Configuring

### Scope

You can configure the scope, which you pass in to the `provider` method via a `Hash`:

* `scope`: A comma-separated list of permissions you want to request from the user. 

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :smile, ENV['SMILE_CLIENT_ID'], ENV['SMILE_CLIENT_SECRET'], scope: 'customer:read'
end
```

