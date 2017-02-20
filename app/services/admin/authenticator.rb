class Admin::Authenticator
  def initialize(admin)
    @admin = admin
  end
  def authenticate
    @admin && @admin.hashed_password
  end
end