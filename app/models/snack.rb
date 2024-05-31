class Snack < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  def self.ransackable_attributes(auth_object = nil)
    %w[name] # Add any attributes you want to allow for searching
  end
end
