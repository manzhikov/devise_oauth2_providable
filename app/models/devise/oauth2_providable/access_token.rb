class Devise::Oauth2Providable::AccessToken
  include Mongoid::Document
  include Mongoid::Timestamps


  field :token,       type: String
  field :expires_at,  type: Time

  expires_according_to :access_token_expires_in

  before_validation :restrict_expires_at, on: :create, if: :refresh_token
  belongs_to :user, :client, :refresh_token

  # attr_accessible :refresh_token

  def token_response
    response = {
      :access_token => token,
      :token_type => 'bearer',
      :expires_in => expires_in
    }
    response[:refresh_token] = refresh_token.token if refresh_token
    response
  end

  private

    def restrict_expires_at
      self.expires_at = [self.expires_at, refresh_token.expires_at].compact.min
    end
end
