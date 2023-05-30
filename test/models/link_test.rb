require "test_helper"

class LinkTest < ActiveSupport::TestCase
  def setup
    @link = Link.new(url: "http://localhost:3000/", slug: "71580d0bff6dd78a1316")
  end

  def test_link_should_not_be_valid_and_saved_without_url
    @link.url = ""
    assert_not @link.valid?
  end

  def test_link_should_not_be_valid_and_saved_without_slug
    @link.slug = ""
    assert_not @link.valid?
  end

  def test_user_should_not_be_valid_and_saved_if_slug_not_unique
    @link.save!

    test_link = @link.dup
    assert_not test_link.valid?
  end
end
