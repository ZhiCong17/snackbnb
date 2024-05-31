class Order < ApplicationRecord
  STATUSES = %w[unpaid created paid shipped cancelled].freeze

  belongs_to :user
end
