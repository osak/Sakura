class User < ActiveRecord::Base
  def self.find_or_create_from_auth_hash(auth_hash)
    user = find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])
    if user.nil?
      user = create! do |user|
        user.provider = auth_hash[:provider]
        user.uid = auth_hash[:uid]
        user.name = auth_hash[:info][:nickname]
      end
    end
    user
  end
end
