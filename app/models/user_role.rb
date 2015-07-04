class UserRole < ActiveRecord::Base
  belongs_to :role
  belongs_to :user
  validates :role, uniqueness: { scope: :user, message: 'one person has no need to grant multi roles same'}
  validates_associated :role
  validates_associated :user
end
