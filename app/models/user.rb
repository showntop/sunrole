require 'utils'

class User < ActiveRecord::Base

  #include Guardian::Subjectable
  #invoke_subjectable_engine
  before_save :ensure_password_is_encrypted

  def self.find_by_login_or_email field_value
    if field_value.include?('@')
      find_by_email(Email.downcase(field_value))
    else
      find_by_login(field_value)
    end
  end

  def password= pawd
    @raw_password = pawd
  end

  def ensure_password_is_encrypted
    return unless @raw_password

    self.salt = Utils::Password.random_salt(16)
    self.encrypted_password = encrypt_password(@raw_password, salt)
  end

  def password_right?(raw_password)
    return false unless encrypted_password && salt
    self.encrypted_password == Utils::Password.encrypt(raw_password, salt)
  end

  def encrypt_password(raw_password, salt)
    Utils::Password.encrypt(raw_password, salt)
  end

  def grant role
    role_id = role.class == Role ? role.id : role
    UserRole.create(user: self, role_id: role_id)
  end

  def grant_batch! roles_or_role_ids
    user_roles = roles_or_role_ids.map { |role| 
                  role.class == Role ? 
                      {user: self, role_id: role.id} : 
                      {user: self, role_id: role} }
    UserRole.create!(user_roles)
  end

end
