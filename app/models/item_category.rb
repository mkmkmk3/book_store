# frozen_string_literal: true

class ItemCategory < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  validates :position, presence: true
end
