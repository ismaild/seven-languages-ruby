class ActAsCsv
  def self.act_as_csv
    define_method 'read' do
      file = File.new(self.class.to_s.downcase + '.csv')
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @result << row.chomp.split(',')
      end
    end
    
    define_method "headers" do
      @headers
    end
    
    define_method "csv_contents" do
      @result
    end
    
    define_method 'initialize' do
      @result = []
      read
    end
  end
end

class SomeCsv < ActAsCsv
  act_as_csv
end

puts "ActAsCsv DSL"
csv = SomeCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect