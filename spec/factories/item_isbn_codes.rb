# frozen_string_literal: true

FactoryBot.define do
  factory :item_isbn_code do
  sequence(:isbn13) { |n| "978-4-10-#{n.to_s.rjust(6, '0')}-1" }
  end
end
