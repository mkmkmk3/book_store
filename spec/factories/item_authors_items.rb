# frozen_string_literal: true

FactoryBot.define do
  factory :item_authors_item do
  association :item_author
  association :item
  author_type { ItemAuthorsItem.author_types[:author] }
  end
end
