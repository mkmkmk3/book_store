# frozen_string_literal: true

class ItemImage < ApplicationRecord
  belongs_to :item
  
  validates :file, presence: true
end
