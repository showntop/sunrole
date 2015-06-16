class UserRole < ActiveRecord::Base
  attr_accessible :role_id, :user_id, :user, :role
  belongs_to :role
  belongs_to :user
  validate :role, uniqueness: true, scope: :user
  validates_associated :role
  validates_associated :user
end
