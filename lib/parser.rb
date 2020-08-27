# Parser for webserver log file
class Parser
  attr_reader :logs

  def initialize(file_path) #Finds webserver.log
    @logs = parse(file_path)
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


