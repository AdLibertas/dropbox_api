module DropboxApi::Metadata
  # NOTE: We should have a test to cover the initialization of this object.
  # Sample:
  # {
  #   "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc",
  #   "name": {
  #       "given_name": "Franz",
  #       "surname": "Ferdinand",
  #       "familiar_name": "Franz",
  #       "display_name": "Franz Ferdinand (Personal)"
  #   },
  #   "email": "franz@dropbox.com",
  #   "email_verified": true,
  #   "disabled": false,
  #   "is_teammate": true,
  #   "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbid%3AAAH4f99T0taONIb-OurWxbNQ6ywGRopQngc?vers=1453416696524&size=128x128",
  #   "team_member_id": "dbmid:AAHhy7WsR0x-u4ZCqiDl5Fz5zvuL3kmspwU"
  # }
  class BasicAccount < Base
    field :account_id, String
    field :name, DropboxApi::Metadata::Name
    field :email, String
    field :email_verified, :boolean
    field :disabled, :boolean
    field :is_teammate, :boolean
    field :profile_photo_url, String
    field :team_member_id, :boolean
  end
end
