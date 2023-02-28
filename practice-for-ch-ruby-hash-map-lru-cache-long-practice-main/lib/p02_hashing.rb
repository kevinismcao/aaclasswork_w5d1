class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    res = 0
    self.each_with_index do |ele, i|
      res += ele*i
    end
    res


  end
end

class String
  def hash
    res = 0
    alph = ("a".."z").to_a
    self.each_char.with_index do |ele, i|
      res += (alph.index(ele.downcase) * i)
    end
    res
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end