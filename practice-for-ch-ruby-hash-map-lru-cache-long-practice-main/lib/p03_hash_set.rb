class HashSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !(@count < @store.length)
      resize!
    end

    if !include?(key)
      @store[key.hash % @store.length] << key
      @count += 1
    end
  end

  def include?(key)
    @store[(key.hash) % @store.length].include?(key)
  end

  def remove(key)
    if include?(key)
      @store[(key.hash) % @store.length].delete(key)
      @count -= 1
    end
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
      @store << []

    (0..@store.length-1).each do |i|
      if !@store[i].empty?
        ele = @store[i].first
        @store[i].delete(ele)
        @store[ele.hash % @store.length] << ele
      end
    end
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end
end

# p "howdy".hash