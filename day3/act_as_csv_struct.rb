require 'ostruct'

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
        row = row.chomp.split(',')
        @csv_contents << OpenStruct.new(Hash[@headers.zip row])
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read 
    end

    def each(&block)
      @csv_contents.each(&block)
    end
  end
end

class SomeCsv
  include ActAsCsv
  act_as_csv
end

puts "ActAsCsv Each with Struct"
csv = SomeCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect
csv.each { |row| puts row.initials }