# frozen_string_literal: true

FactoryBot.define do
  factory :item_author do
  sequence(:name) { |n| "Name#{n}" }
  end
end
