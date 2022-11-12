
def split_into_words(str)
    str.downcase.split(/[^a-z']+/)
end
   
def get_frequent_words(array, amount)
    if array == ""
        return []
    end
    frequent_words = array.group_by { |word| word }
          .inject({}) { |map, (key, val)| map.merge(key => val.size)}
          .sort_by {|key, value| value}
          .filter_map { |key, value| key }
          .reverse
    frequent_words.size < amount ? frequent_words : frequent_words.first(amount)
end
   
def frequent_words(inp, amount)
    get_frequent_words(split_into_words(inp), amount)
end
   
input1 = "In a village of La Mancha, the name of which I have no desire to call to
   mind, there lived not long since one of those gentlemen that keep a lance
   in the lance-rack, an old buckler, a lean hack, and a greyhound for
   coursing. An olla of rather more beef than mutton, a salad on most
   nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
   on Sundays, made away with three-quarters of his income."

input2 = "We WE we rock"
   
input3 = ""

input4 = "We wish you a merry Christmas, We wish you a merry Christmas, We wish you a merry Christmas and happy New Year"
   
puts "Result 1:" + frequent_words(input1, 3).to_s
puts "Result 1.2:" + frequent_words(input1, 4).to_s
puts "Result 2:" + frequent_words(input2, 3).to_s
puts "Result 3:" + frequent_words(input3, 3).to_s
puts "Result 4:" + frequent_words(input4, 6).to_s