class Fixnum
  # Fixnum#hash already implemented for you
end

require "byebug"

class Array
  def hash
    return 1 if self.empty?
    arr = []

      self.each_with_index do |ele, i|
        arr << (ele.hash * i.hash)
      end

      arr.reduce(:+).hash
  end

end

class String
  def hash
    arr = []

    alpha = ("A".."z").to_a

      self.chars.each_with_index do |char, i|
        arr << (alpha.find_index(char).hash * i.hash)
      end

      arr.reduce(:+).hash

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = []
    k = self.keys
    v = self.values
    alpha = ("A".."z").to_a

    k.each_with_index do |ele,i|
      if ele.is_a?(Symbol)
        if ele.to_s.to_i ==  0#if its a number, it will return true, else false. *0 arent accounted for
          arr << ele.to_s.to_i.hash
        else
          arr << ele.to_s.hash
        end
      end
    end

    v.each_with_index do |ele,i|
      arr << ele.hash
    end

      arr.reduce(:+).hash
  end
end

# arr = []
# self.arr {|el| arr << el}
# arr.join("").to_i
#
# if self.sort[1] == self[1]
#   Fixnum.hash
# end

# k.each_with_index do |ele,i|
#   # if ele.nil?
#   #   arr << 0
#   #   next
#   # end
#   if ele.is_a?(String)
#     arr << alpha.find_index(ele)
#   elsif ele.is_a?(Symbol)
#     current = ele.to_s
#     if current.to_i == 0
#       arr << alpha.find_index(ele)
#     else
#       debugger
#       arr << (current.to_i * i) + 52
#     end
#
#   elsif ele.is_a?(Integer)
#       arr << (ele * i) + 52
#     end
#   end
