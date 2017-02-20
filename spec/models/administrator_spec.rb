require 'rails_helper'

# RSpec.describe Administrator, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
describe Administrator do
  describe "password" do
    example "文字列でパスワード生成すると60文字変換される" do
      administrator = Administrator.new(password: "a")
      expect(administrator.hashed_password).to be_kind_of(String)
      expect(administrator.hashed_password.size).to eq(60)
    end
  end
end