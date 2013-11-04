class Tree
  attr_accessor :children, :node_name

  def initialize(structure)
    @node_name = structure.keys.first
    @children = structure[@node_name].collect { |k,v| Tree.new({k => v}) }
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

puts "-"
puts "Tree..."
structure = {'grandpa' => 
  { 
    'dad' => {'child 1' => {}, 'child 2' => {} }, 
    'uncle' => {'child 3' => {}, 'child 4' => {} } 
  } 
}
ruby_tree = Tree.new(structure)
puts "Visiting node.."
ruby_tree.visit {|node| puts node.node_name} 
puts
puts "visiting entire tree..."
ruby_tree.visit_all {|node| puts node.node_name}
puts