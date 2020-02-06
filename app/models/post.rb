# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :pic
end
