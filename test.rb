require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestWebserver < Minitest::Test

  def initialize(file_path) #Finds webserver.log
    @logs = parse(file_path)
  end
  
  # def test_a_fast_operation
  #   pass
  # end

  # def test_a_slower_operation
  #   sleep(0.33) && pass
  # end

  # def test_a_really_slow_operation
  #   sleep(1) && pass
  # end

  # def test_pass
  #   pass
  # end

  # def test_fail
  #   pass
  # end

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

