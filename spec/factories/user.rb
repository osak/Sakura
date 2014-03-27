FactoryGirl.define do
  factory :user do
    name "osa_k"
    provider "twitter"
    uid 1
    can_upload false
  end
end
