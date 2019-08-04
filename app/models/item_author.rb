# frozen_string_literal: true

class ItemAuthor < ApplicationRecord
  has_many :item_authors_items, dependent: :destroy
  has_many :items, through: :item_authors_items

  validates :name, presence: true, length: { maximum: 20 }
end
