class NilClass
  def blank?
    true
  end
end

class String
  def blank?
    self.size == 0
  end
end

puts "blank..."
['','person'].each { |s| puts s unless s.blank? }