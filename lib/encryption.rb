def encrypt(input_text, offset)
  raise ArgumentError, 'String must not be empty' if input_text == ''
  raise ArgumentError, 'Offset must not be zero' if offset == 0

  input_text = input_text.upcase
  text_list = []
  letter_index = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
  encrypted_text = ''

  counter = 0
  while counter < input_text.length
    text_list << input_text[counter]
    counter += 1
  end

  counter = 0
  while counter < text_list.size
    new_letter = ''
    letter_index.each { |x|
      if text_list[counter] == nil
        return nil
      elsif text_list[counter] == x
        temp = letter_index.index(text_list[counter]) + offset
        if temp > letter_index.size - 1
          temp = temp - letter_index.size
        end
        new_letter = letter_index[temp]
      end
    }
    if new_letter == ''
      new_letter = text_list[counter]
    end
    encrypted_text += new_letter if new_letter != nil
    counter += 1
  end
  return encrypted_text
end

def decrypt(input_text, offset)
  offset *= -1

  decrypted_text = encrypt(input_text, offset).downcase
  return decrypted_text
end
