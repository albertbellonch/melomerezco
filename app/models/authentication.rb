class Authentication < ActiveRecord::Base
  serialize :info, Hash
  serialize :extra, Hash

  belongs_to :user

  validates_presence_of :provider, :uid, :user

  OAUTH_PROVIDERS.each do |provider|
    scope provider, where(provider: provider)
  end
end
