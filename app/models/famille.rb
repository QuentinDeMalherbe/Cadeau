class Famille < ApplicationRecord
  has_many :users, dependent: :destroy
  accepts_nested_attributes_for :users, allow_destroy: true, reject_if: :reject_users

  def reject_users(attributes)
    attributes['first_name'].blank?
  end
end
