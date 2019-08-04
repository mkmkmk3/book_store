# frozen_string_literal: true

class ItemAuthorsItem < ApplicationRecord
  belongs_to :item_author
  belongs_to :item
  
  # 著者タイプ
  enum author_type: {
    author: 'author',
    translator: 'trnaslator',
    other: 'other'
  }, _prefix: true
end
