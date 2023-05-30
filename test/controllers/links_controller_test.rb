require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @link = Link.create(url: "http://localhost:3000/", slug: "71580d0bff6dd78a1316")
  end

  def test_should_get_new_form
    get new_link_url
    assert_response :success
  end

  def test_should_create_new_link
    assert_difference("Link.count") do
      post links_url, params: { link: { url: @link.url } }
    end

    assert_redirected_to link_url(Link.last)
  end

  def test_should_show_link
    get link_url(@link.id)
    assert_response :success
  end
end
