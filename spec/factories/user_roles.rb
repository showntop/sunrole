FactoryGirl.define do
  factory :user_role do
    user_id 1
    role_id 1
  end

  factory :user_role_invalid do
    user_id 10000000
    role_id 10000000
  end
end
