class Expense < ApplicationRecord
  belongs_to :category

  before_validation :set_default_payer_name, on: :create

  private

  def set_default_payer_name
    self.payer_name = "User" if payer_name.blank?
  end
end
