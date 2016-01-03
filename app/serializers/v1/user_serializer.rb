class V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :login, :email, 
              :sign_in_count, :current_sign_in_at, :last_sign_in_at, 
              :current_sign_in_ip, :last_sign_in_ip, :created_at, :updated_at
end
