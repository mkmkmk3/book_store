# frozen_string_literal: true

FactoryBot.define do
  factory :item_seller do
  sequence(:name) { |n| "Name#{n}" }
  end
end
