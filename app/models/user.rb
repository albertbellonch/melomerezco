class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: OAUTH_PROVIDERS

  belongs_to :group

  class << self
    def find_or_create_for_oauth(auth)
      authentication = Authentication.find_or_initialize_by_provider_and_uid(auth.provider, auth.uid)
      authentication.info.merge!(auth[:info].to_hash)
      authentication.extra.merge!(auth[:extra].to_hash)

      if authentication.persisted?
        authentication.user
      else
        user = create(email: auth.info.email).tap do |new_user|
          new_user.name = auth.info['first_name']
          new_user.surnames = auth.info['last_name']
          new_user.password = SecureRandom.hex(16)
        end

        authentication.user = user
        authentication.save

        user
      end
    end
  end
end
