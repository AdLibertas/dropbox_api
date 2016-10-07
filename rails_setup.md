# Standard OAuth 2 flow set up

The generic description of the process we are implementing in this guide can be
found at Dropbox's [Oauth guide](https://www.dropbox.com/developers/reference/oauth-guide#oauth-2-on-the-web).

Precisely, we'll be doing something like the following:
![Oauth 2 flow](https://www.dropbox.com/static/images/developers/oauth2-web-diagram.png)

## 1. Set up some new routes

You'll have to create a couple of new routes:

```ruby
get 'dropbox/auth' => 'dropbox#auth'
get 'dropbox/auth_callback' => 'dropbox#auth_callback'
```

We'll use `dropbox/auth` to perform the step 2 in the diagram, i.e. this route
will redirect to Dropbox.

The other route, `dropbox/auth_callback`, will process the authentication token
that we'll receive from Dropbox. Steps 4 & 5.

## 2. Set up a Dropbox controller

```ruby
class DropboxController < ApplicationController
  # Example call:
  # GET /dropbox/auth
  def auth
    url = authenticator.authorize_url :redirect_uri => redirect_uri

    redirect_to url
  end

  # Example call:
  # GET /dropbox/auth_callback?code=VofXAX8DO1sAAAAAAAACUKBwkDZyMg1zKT0f_FNONeA
  def auth_callback
    auth_bearer = authenticator.get_token(params[:code],
                                          :redirect_uri => redirect_uri)
    token = auth_bearer.token # This line is step 5 in the diagram.

    # At this stage you may want to persist the reusable token we've acquired.
    # Remember that it's bound to the Dropbox account of your user.

    # If you persisted the token, you can use it in subsequent requests or
    # background jobs to perform calls to Dropbox API such as the following.
    folders = DropboxApi::Client.new(token).list_folder "/"
  end

  private

  def authenticator
    client_id = "az8ykn83kecoodq"
    client_secret = "ozp1pxo8e563fc5"

    DropboxApi::Authenticator.new(client_id, client_secret)
  end

  def redirect_uri
    dropbox_auth_callback_url # => http://localhost:3000/dropbox/auth_callback
  end
end
```

## 3. Set up redirect URI in your Dropbox app settings
