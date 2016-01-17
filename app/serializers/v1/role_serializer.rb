class V1::RoleSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at, :updated_at
end
