class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return (rand*9999999).hash if self.empty?
    arr = []
    self.each.with_index do |ele, idx|
      arr[idx]=ele.hash
    end
    arr.reduce(:-)
  end
end

class String
  def hash
    arr = []
    self.each_byte do |c|
      arr << c.hash
    end
    arr.reduce(:-)
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method

  0

  # def hash
    
  #   arr = []
  #   self.each do |k, v|
  #     arr << k.hash + v.hash
  #   end
  #   arr.reduce(:+)
  # end
end
