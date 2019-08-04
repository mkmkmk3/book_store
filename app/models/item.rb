# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :item_category
  belongs_to :item_seller
  has_one :item_image, dependent: :destroy
  has_many :item_authors_items, dependent: :destroy
  has_many :item_authors, through: :item_authors_items
  has_one :item_isbn_code, dependent: :destroy

  validates :title, presence: true, length: { maximum: 60 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
