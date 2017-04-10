Omniauth-eleme-oauth2
======================

Eleme OAuth2 Strategy for OmniAuth 1.0. 

You need to get a eleme API key at: https://open.shop.ele.me/

Eleme oauth2 specification can be found at: https://open.shop.ele.me/openapi/documents/oauth

## Installation

Add to your `Gemfile`:

```ruby
gem "omniauth-eleme-oauth2"
```

Then `bundle install`.


## Usage

Here's an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :eleme, ENV["ELEME_KEY"], ENV["ELEME_SECRET"]
end
```

You can now access the OmniAuth Eleme OAuth2 URL: `/auth/eleme`

## Configuration

You can configure several options, which you pass in to the `provider` method via a hash:

For devise user, you can set up scope in your devise.rb as following.

```ruby
config.omniauth :eleme, ENV["ELEME_KEY"], ENV["ELEME_SECRET"]
```

## Auth Hash

Here's an example of an authentication hash available in the callback by accessing `request.env["omniauth.auth"]`:

```ruby
{
    :provider => "eleme",
    :info => {
      token_type: "bearer"
    },
    :credentials => {
        :token => "access_token",
        :refresh_token => "refresh_token",
        :expires_in => 7200,
        :expires => true
    },
    :extra => {}
}
```

Also, you may need params from redirect_uri. e.g. if you access http://localhost:3000/auth/eleme?branch_id=25. Here's an example of an parameter hash available in the callback by accessing `request.env["omniauth.params"]`.:

```
{
  branch_id: 25
}
```

If you have any question about this gem, please contact me by email (xie_s@isumeng.com) or wechat(微信号：wanxsb)

