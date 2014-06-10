############################
#
# => BINARY PRE ORDER POST ORDER BreadthFirst
#
############################

class Class_binary

  attr_reader :root

  def initialize
    @root = nil
  end

  def insert( key )
    if @root.nil?
      @root = Node.new( key )
    else
      @root.insert( key )
    end
    self
  end
  
  def BreadthFirst( node=@root, &block )
    return if node.nil?
    inorder( node.left,  &block )
    
    yield node
    inorder( node.left,  &block )
    inorder( node.right, &block )
  end
  
  def inorder( node=@root, &block )
    return if node.nil?
    inorder( node.left,  &block )
    yield node
    inorder( node.right, &block )
  end

  def preorder( node=@root, &block )
    return if node.nil?
 
    preorder( node.left,  &block )
    yield node
    preorder( node.right, &block )
  end

  def postorder( node=@root, &block )
    return if node.nil?
    postorder( node.left,  &block )
    postorder( node.right, &block )
    yield node
  end


  class Node
    attr_reader :key, :left, :right

    def initialize( key, left=nil, right=nil )
      @key = key
      @left, @right = left, right
    end

    def insert( key )
      if key < @key

        @left.nil?  ? @left  = Node.new( key ) : @left.insert( key )
      elsif key > @key

        @right.nil? ? @right = Node.new( key ) : @right.insert( key )
      end
    end

    def to_s
      @key.to_s
    end
  end
  
end

a=Class_binary.new

a.insert("a").insert("b").insert("c").insert("d").insert("e").insert("f").insert("g").insert("h").insert("i")
print "Pre Order : "
a.inorder{|data| print "#{data} "}
puts
print "Pre Order : "  
a.preorder{|data| print "#{data} "}
puts 
print "Post Order : "
a.postorder{|data| print "#{data} " }
puts""
print "a: "
a.BreadthFirst{|data| print "#{data} "}
