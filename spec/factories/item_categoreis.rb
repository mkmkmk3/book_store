# frozen_string_literal: true

FactoryBot.define do
  factory :item_category do
  sequence(:name) { |n| "Name#{n}" }
  sequence(:position) { |n| n }
  end
end
