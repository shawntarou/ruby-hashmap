require_relative 'linkedlist'

class HashMap
  def initialize
    @buckets = Array.new(16) {LinkedList.new}
    @load_factor = 0.75
    @capacity = @buckets.length
    @load_level = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char {|char| hash_code = prime_number * hash_code + char.ord}

    hash_code
  end

  def get_index(key)
    hash_code = hash(key)
    index = hash_code % @capacity
    raise IndexError if index.negative? || index >= @capacity

    index
  end
  
  def need_growth?
    return true if @load_level >= @capacity * @load_factor

    false
  end

  def grow
    new_array = Array.new(@capacity * 2) {LinkedList.new}
    @capacity *= 2

    entries.each do |key, value|
      index = get_index(key)
      new_array[index].append(key, value)
    end

    @buckets = new_array
  end

  def set(key, value)
    if need_growth? then grow end

    index = get_index(key)
    
    unless self.keys.include?(key)
      @buckets[index].append(key, value)
      @load_level += 1
      return
    end

    @buckets.each do |bucket| 
      if bucket.contains_key?(key) then bucket.insert_new_value(key, value) end
    end
  end

  def print_all
    n = 0
    @buckets.each do |list| 
      print "#{n}: "
      puts "#{list.to_s}"
      n += 1
    end
  end

  def get(key)
    index = get_index(key)
    value = @buckets[index].get_value(key)

    value
  end

  def has?(key)
    index = get_index(key)

    @buckets[index].contains_key?(key)
  end

  def remove(key)
    index = get_index(key)
    pair_index = @buckets[index].find(key)
    value = @buckets[index].remove_at(pair_index)
    @entries -= 1

    value
  end

  def length
    sum_length = 0
    @buckets.each do |bucket|
      unless bucket.head.nil? then sum_length += bucket.size end
    end

    sum_length
  end

  def clear
    @buckets.each do |bucket|
      unless bucket.head.nil? then bucket.clear_all end
    end
    @entries = 0 
  end

  def keys
    keys = []
    @buckets.each do |bucket|
      unless bucket.head.nil? then keys += bucket.get_all_keys end
    end

    keys
  end

  def values
    values = []
    @buckets.each do |bucket|
      unless bucket.head.nil? then values += bucket.get_all_values end
    end

    values
  end

  def entries
    entries = []
    @buckets.each do |bucket|
      unless bucket.head.nil? then entries += bucket.get_all_entries end
    end

    entries
  end
end