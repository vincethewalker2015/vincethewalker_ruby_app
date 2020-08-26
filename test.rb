require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestWebserver < Minitest::Test
  

  # test "Should see webserver log" do
  #   skip "Will do this first"
  # end
  # def should_see_webserver_log 
  #   if File.exist?('parser')
  #     assert_response :success
  #   end
  # end

  def test_that_parser_file_exists 
    if File.exist?('parserbitch')
    assert true
    end
  end

  # def test_that_webserverlog_file_exists 
  #   File.exist?('webserver')
  #     assert :true
  # end

  # def test_that_will_be_skipped 
  #   skip "test this later"
  # end

end

