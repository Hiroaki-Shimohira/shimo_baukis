class Administrator < ApplicationRecord
  before_validation do
    self.email_for_index = email.downcase if email
  end

  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    else raw_password.nil?
      self.hashed_password = nil
    end
  end

  # def active?
  #   !suspended? && updated_at <= Date.today
  # end
end
