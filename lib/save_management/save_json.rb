require 'json'

class SaveJSON
  def initialize(obj)
    @valera = obj
    @valera_stats = @valera.stats!
  end

  def create_save(path)
    File.open("././saves/#{path}.json", 'w') do |f|
      f.write(@valera_stats.to_json)
    end
  end

  def self.enter_filename
    puts 'Enter username:'
    gets.chomp.to_s
  end
end
