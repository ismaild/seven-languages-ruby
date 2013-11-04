class ActAsCsv
  def read
    file = File.new(self.class.to_s.downcase + '.csv')
    @headers = file.gets.chomp.split(',')

    file.each do |row|
      @result << row.chomp.split(',')
    end
  end

  def headers
    @headers
  end

  def csv_contents
    @result
  end

  def initialize
    @result = []
    read
  end
end

class SomeCsv < ActAsCsv
end

puts "ActAsCsv Class"
csv = SomeCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect