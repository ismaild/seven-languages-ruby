module ActAsCsv
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def act_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.csv'
      file = File.new(filename)
      @headers = file.gets.chomp.split(',')

      file.each do |row|
        @csv_contents << row.chomp.split(',')
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read 
    end
  end
end

class SomeCsv
  include ActAsCsv
  act_as_csv
end

puts "ActAsCsv Module"
csv = SomeCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect