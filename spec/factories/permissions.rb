FactoryGirl.define do
  factory :permission do
    behavior "allow"
    role_id 1
    action_name "read"

    module_name "/"
    resource_type "MyString"
    resource_id "MyString"
  end

end
