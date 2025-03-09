class LinkedList
  @head = nil

  def append(key, value)
    new_node = Node.new(key, value)

    if @head.nil? 
      @head = new_node
      return
    end

    curr_node = @head

    until curr_node.next_node.nil?
      curr_node = curr_node.next_node
    end

    curr_node.next_node = new_node

    new_node.value
  end

  def insert_new_value(key, value)
    return nil if @head.nil?

    curr_node = @head

    until curr_node.nil?
      if curr_node.key == key 
        curr_node.value = value
        return
      end

      curr_node = curr_node.next_node
    end

    nil
  end

  def head
    return nil if @head.nil?

    @head.value
  end
  
  def tail
    return if @head.nil?

    curr_node = @head

    until curr_node.next_node.nil?
      curr_node = curr_node.next_node
    end

    curr_node.value
  end

  def at(index)
    if index+1 > self.size || index < 0 then return -1 end

    i = 0
    curr_node = @head

    until i == index
      curr_node = curr_node.next_node
      i += 1
    end

    curr_node.value
  end

  def pop
    return if @head.nil?

    curr_node = @head

    until curr_node.next_node.next_node.nil?
      curr_node = curr_node.next_node
    end

    pop_node = curr_node.next_node
    curr_node.next_node = nil

    pop_node.value
  end

  def contains_key?(key)
    return false if @head.nil?

    curr_node = @head

    until curr_node.nil?
      return true if curr_node.key == key
      curr_node = curr_node.next_node
    end

    return false
  end

  def contains_value?(value)
    return false if @head.nil?

    curr_node = @head

    until curr_node.nil?
      return true if curr_node.value == value
      curr_node = curr_node.next_node
    end

    return false
  end

  def get_value(key)
    return nil if @head.nil?

    curr_node = @head

    until curr_node.nil?
      return curr_node.value if curr_node.key == key
      curr_node = curr_node.next_node
    end
    
    return nil
  end

  def get_key(value)
    return nil if @head.nil?

    curr_node = @head

    until curr_node.nil?
      return curr_node.key if curr_node.value == value
      curr_node = curr_node.next_node
    end
    
    return nil
  end

  def get_all_keys
    return nil if @head.nil?

    curr_node = @head
    keys = []

    until curr_node.nil?
      keys << curr_node.key
      curr_node = curr_node.next_node
    end
    
    keys
  end

  def get_all_values
    return nil if @head.nil?

    curr_node = @head
    values = []

    until curr_node.nil?
      values << curr_node.value
      curr_node = curr_node.next_node
    end
    
    values
  end

  def get_all_entries
    return nil if @head.nil?
    
    curr_node = @head
    entries = []

    until curr_node.nil?
      entries << [curr_node.key, curr_node.value]  
      curr_node = curr_node.next_node
    end
    
    entries
  end

  def find(key)
    return nil if @head.nil?

    curr_node = @head
    i = 0

    until curr_node.nil?
      return i if curr_node.key == key
      curr_node = curr_node.next_node
      i += 1
    end
    
    return nil
  end

  def to_s
    if @head == nil
      return
    end

    curr = @head

    until curr.nil? 
      print "( #{curr.key}, #{curr.value} ) -> "
      curr = curr.next_node
    end

    print 'nil'
  end

  def size
    return 0 if @head.nil?

    size_count = 0
    curr_node = @head

    until curr_node.nil?
      size_count += 1
      curr_node = curr_node.next_node
    end

    size_count
  end

  def remove_at(index)
    return if @head.nil?
    return if index+1 > self.size || index < 0

    if index == 0 
      remove_node = @head
      @head = @head.next_node 
      return remove_node.value
    end

    curr_node = @head
    i = 0

    until i+1 == index
      curr_node = curr_node.next_node
      i += 1
    end

    remove_node = curr_node.next_node
    curr_node.next_node = curr_node.next_node.next_node

    remove_node.value
  end

  def clear_all
    @head = nil
  end

  class Node
    attr_accessor :value, :next_node, :key

    def initialize(key=nil, value=nil)
      @key = key
      @value = value
      @next_node = nil
    end
  end
end 