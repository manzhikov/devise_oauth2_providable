class Devise::Oauth2Providable::AuthorizationCode
  include Mongoid::Document
  include Mongoid::Timestamps
  include Devise::Oauth2Providable::ExpirableToken

  field :token, type: String
  field :expires_at, type: Time

  belongs_to :user, :client

  expires_according_to :authorization_code_expires_in
end
