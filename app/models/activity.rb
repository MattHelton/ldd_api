class Activity < ApplicationRecord
  validates :item, presence: true, length: { minimum: 3 }
end
