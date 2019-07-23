class HashSet
attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(ele)
    if !include?(ele)
      @count += 1
      self[ele] << ele
    end
    if @count > num_buckets
      resize! 
    end
  end

  def remove(ele)
    if include?(ele)
      @count -= 1
      self[ele].delete(ele)
    end
  end

  def include?(ele)
    self[ele].include?(ele)
  end

  private

  def [](ele)
    @store[ele.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    # if @count >= num_buckets 
      temp = HashSet.new(num_buckets * 2)
      @store.each do |n|
        n.each do |ele|
          temp.insert(ele)
        end
      end
    # end
    @store = temp.store
  end

  # attr_reader :count

  # def initialize(num_buckets = 8)
  #   @store = Array.new(num_buckets) { Array.new }
  #   @count = 0
  # end

  # def insert(key)
     
  # end

  # def include?(key)
  # end

  # def remove(key)
  # end

  # private

  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  # end

  # def num_buckets
  #   @store.length
  # end

  # def resize!
  # end
end
