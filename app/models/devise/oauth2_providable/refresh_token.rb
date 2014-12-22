class Devise::Oauth2Providable::RefreshToken
  include Mongoid::Document
  include Mongoid::Timestamps

  field :token,       type: String
  field :expires_at,  type: Time

  belongs_to :user, :client

  expires_according_to :refresh_token_expires_in

  # attr_accessible :access_tokens

  has_many :access_tokens

end
