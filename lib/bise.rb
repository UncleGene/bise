require "bise/version"

module Bise  
  ##
  # Finds the first string in the presorted text file that satisfies term <= str. 
  # Takes optional comparison block accepting term and str. 
  # Default - { |term, str| term <=> str }

  def bin_find(term, &comp)
    comp ||=  lambda{|term, str| term <=> str}
    bin_search(term, 0, stat.size, &comp)
  end
  

  private
  
  def bin_search(term, start, finish, &comp)
    pos = (start + finish) / 2 
    seek pos
    gets unless pos == 0
    str = gets
    return str && str.chomp if start >= finish
    return nil unless str
    case yield(term, str.chomp!) 
    when 1
      next_str = gets
      return nil unless next_str
      return next_str if yield(term, next_str.chomp!) != 1
      return bin_search(term, pos, finish, &comp) if start < pos
      start == 0 ? str : next_str 
    when -1
      bin_search(term, start, pos, &comp)
    else
      str
    end
  end
end

class File
  include Bise
end
