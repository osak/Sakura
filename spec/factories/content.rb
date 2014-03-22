FactoryGirl.define do
  sequence :content_name do |n|
    "Content #{n}"
  end

  factory :content do
    name { generate :content_name }
    size 42
  end
end
