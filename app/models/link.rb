class Link < ApplicationRecord
  validates :url, presence: true
  validates :slug, uniqueness: true
end