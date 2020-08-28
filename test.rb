require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestWebserver < Minitest::Test
  attr_reader :logs
  def set_up #Finds webserver.log
    @logs = parse(file_path)
    @ip_regex = /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/
  end
  
  def test_must_see_webserver_log 
    if @logs
      assert_response :success
    end
  end

  def test_must_find_ip_address
     if @ip_regex
        assert_response :success
     end
  end

  def test_must_get_unique_views
    if @logs 
      assert_match 'unique view'
    end
  end

  def test_must_get_most_visits
    if @logs
      assert_match 'visit'
    end
  end

  private

  def parse(file_path) 
    default_value = Hash.new { |hash, key| hash[key] = [] }

    File.open(file_path) do |file|
      file.each_with_object(default_value) do |line, hsh|
        site, ip = line.split(/\s+/)
        hsh[site] << ip
      end
    end
  end


end

