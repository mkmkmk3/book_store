# frozen_string_literal: true

FactoryBot.define do
  factory :item_image do
  sequence(:file) { |n| "/image#{n}.png" }
  end
end
