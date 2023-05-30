class Link < ApplicationRecord
  validates :url, presence: true
  validates :slug, uniqueness: true

  before_create :set_slug

  private

    def set_slug
      loop do
        new_slug = SecureRandom.hex(6)
        unless Link.where(slug: new_slug).exists?
          self.slug = new_slug
          break
        end
      end
    end
end