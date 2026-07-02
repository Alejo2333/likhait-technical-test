class Expense < ApplicationRecord
  belongs_to :category

  before_validation :set_default_payer_name, on: :create

  validate :date_cannot_be_in_future

  private

  def set_default_payer_name
    self.payer_name = "User" if payer_name.blank?
  end

  def date_cannot_be_in_future
    return if date.blank?

    errors.add(:date, "cannot be in the future") if date > Date.current
  end
end
