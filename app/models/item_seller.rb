# frozen_string_literal: true

class ItemSeller < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, presence: true, length: { maximum: 40 }, uniqueness: true
end
