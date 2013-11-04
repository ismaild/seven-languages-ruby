# Blocks
puts "blocks..."
def call_block(&block)
  block.call
end

def pass_block(&block)
  call_block(&block)
end

pass_block { puts "Hello Block" }

puts "-"
puts "Printing array in slices of 4..."
arr = (1..16).to_a

puts "using each.."
arr.each { |val| puts arr[((val-4)...val)].join(",") if val % 4 == 0 }

puts "using each slide"
arr.each_slice(4) {|val| puts val.join(",")}

