class V1::DeptSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :parent_id
  has_many :children, embed: :objects 
end
