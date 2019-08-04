# frozen_string_literal: true

class ItemIsbnCode < ApplicationRecord
  belongs_to :item

  validates :isbn13, presence: true, length: { is: 13 }, uniqueness: true
end
