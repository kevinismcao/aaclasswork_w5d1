class MaxIntSet
  attr_reader :max, :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if !is_valid?(num)
      raise "Out of bounds"
    else
      @store[num] = true
    end
    
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    !(num > max || num < 0)
  end

  def validate!(num)

  end
end

class IntSet
  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !store.include?(num)
      @store[num % @store.length] << num
    end
    
  end

  def remove(num)
    if include?(num)
      @store[num % @store.length].delete(num)
    end

  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !(@count < @store.length)
      resize!
    end

      if !include?(num)
        @store[num % (@store.length)] << num
        @count += 1
      end
  end

  def remove(num)
    if include?(num)
      @store[num % (@store.length)].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % (@store.length)].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    @store.length.times do
      @store << []

    end

    (0..@store.length-1).each do |ele|
      if !@store[ele].empty?
        num = @store[ele].first
        @store[ele].delete(num)
        @store[num % @store.length] << num
      end
    end

  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end
end