def encrypt(text)
  return 'No text found' if text == nil

  text = text.upcase
  text_list = []
  offset = 3
  letter_index = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  etext = ""

  i = 0
  while i < text.length
    text_list << text[i]
    i += 1
  end
  p text_list

  i = 0
  while i < text_list.length
    new_letter = ""
    letter_index.each { |x|
      if text_list[i] == nil
        return nil
      elsif text_list[i] == x
        temp = letter_index.index(text_list[i]) + offset
        if temp > letter_index.length
          temp = temp - letter_index.length
        end
        new_letter = letter_index[temp]
      end
    }
    if new_letter == ""
      new_letter = text_list[i]
    end
    etext += new_letter
    i += 1
  end
  puts etext
end

encrypt("hello")