# Parser for webserver log file
class Parser
  attr_reader :logs

  def initialize(file_path) #Finds webserver.log
    @logs = parse(file_path)
  end

  def most_unique_views
    @logs
      .sort_by { |_, ips| ips.uniq.length }
      .reverse
      .map { |site, ips| pluralize(site, ips.uniq.length, 'unique view') }
  end

  def most_visits
    @logs
      .sort_by { |_, ips| ips.length }
      .reverse
      .map { |site, ips| pluralize(site, ips.length, 'visit') }
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

  def pluralize(site, number, description)
    description = number > 1 ? "#{description}s" : description

    "#{site} #{number} #{description}"
  end
end

parser = Parser.new(ARGV.first)

  puts "\nWebpages with most visited: \n\n"
  puts parser.most_visits

  puts "\nWebpages with most unique page views \n\n"
  puts parser.most_unique_views

