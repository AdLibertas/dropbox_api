# DropboxApi

Library for communicating with Dropbox API v2.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dropbox_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dropbox_api

## Documentation

Please, refer to this gem's custom [Dropbox API
documentation](http://jesus.github.io/dropbox_api).
Most of the time you'll be checking the [available
endpoints](http://jesus.github.io/dropbox_api/DropboxApi/Client.html).

Unfortunately, the documentation at [RubyDoc.info](http://www.rubydoc.info) is
disrecommended because it lacks some nice features that have been added with
YARD plugins:

- Each endpoint includes its tests right below the description, this works as
  an example of its usage.
- All endpoints are shown as methods of the `Client` class, just as you will
  use them.

## Basic set up

### Authorize your application

Dropbox uses OAuth, in order to use this library from your application you'll
have to get an authorization code.

Once you have it, just pass it on client initialization:

```ruby
DropboxApi::Client.new("VofXAX8D...")
#=> #<DropboxApi::Client ...>
```

Or set it as an ENV variable called `DROPBOX_OAUTH_BEARER`, for example:

```ruby
ENV["DROPBOX_OAUTH_BEARER"] = "VofXAX8D..."
DropboxApi::Client.new
#=> #<DropboxApi::Client ...>
```

Note that setting an ENV variable is only a feasible choice if you're only
using one account.

#### Option A: Get your access token from the website

The easiest way to obtain an access token is to get it from the Dropbox website.
You just need to log in to Dropbox and refer to the *developers* section, go to
*My apps* and select your application, you may need to create one if you
haven't done so yet.

Under your application settings, find section *OAuth 2*. You'll find a button
to generate an access token.

#### Option B: Use `DropboxApi::Authenticator`

You can obtain an authorization code with this library:

```ruby
authenticator = DropboxApi::Authenticator.new(CLIENT_ID, CLIENT_SECRET)
authenticator.authorize_url #=> "https://www.dropbox.com/..."

# Now you need to open the authorization URL in your browser,
# authorize the application and copy your code.

auth_bearer = authenticator.get_token(CODE) #=> #<OAuth2::AccessToken ...>`
auth_bearer.token #=> "VofXAX8D..."
# Keep this token, you'll need it to initialize a `DropboxApi::Client` object
```

#### Standard OAuth 2 flow

This is what many web applications will use. The process is described in
Dropbox's [OAuth guide]
(https://www.dropbox.com/developers/reference/oauth-guide#oauth-2-on-the-web).

If you have a Rails application, you might be interested in this [setup
guide](http://jesus.github.io/dropbox_api/file.rails_setup.html).

### Performing API calls

Once you've initialized a client, for example:

```ruby
client = DropboxApi::Client.new("VofXAX8D...")
#=> #<DropboxApi::Client ...>
```

You can perform an API call like this:

```ruby
result = client.list_folder "/sample_folder"
#=> #<DropboxApi::Results::ListFolderResult>
result.entries
#=> [#<DropboxApi::Metadata::Folder>, #<DropboxApi::Metadata::File>]
result.has_more?
#=> false
```

The instance of `Client` we've initialized is the one you'll be using to
perform API calls. You can check the class' documentation to find
[all available endpoints](http://jesus.github.io/dropbox_api/DropboxApi/Client.html)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Any help will be much appreciated. The easiest way to help is to implement one
or more of the [endpoints that are still pending](http://jesus.github.io/dropbox_api/file.api_coverage.html). To see how the
endpoints are implemented, check out the `lib/dropbox_api/endpoints` folder.

If you want to help but you're unsure how to get started, please get in touch
by opening an issue.

Here's the standard way to submit code updates:

1. Fork it ( https://github.com/Jesus/dropbox_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
