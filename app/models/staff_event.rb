class StaffEvent < ApplicationRecord
  self.inheritance_column = nil

  belongs_to staff_member
  alias_attribute :occurred_at, :created_at
end
