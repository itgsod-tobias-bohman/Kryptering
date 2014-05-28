# Public: Encrypts a string using an offset.
#
# input_text  - The string to be encrypted.
#
# offset  - Integer to define how much text will be encrypted.
#
# Examples
#
#   encrypt('hello', 3)
#   # => 'KHOOR'
#
# Returns the input_text encrypted.
# Raises error if input_text = ''
# Raises error if offset = 0
def encrypt(input_text, offset)
  # Error messages for: empty strings & offset == 0.
  raise ArgumentError, 'String must not be empty' if input_text == ''
  raise ArgumentError, 'Offset must not be zero' if offset == 0

  # Makes the input text uppercase letters only.
  input_text = input_text.upcase

  # Will hold all letters from input_text.
  text_list = []

  # Defines each letter with a number using index.
  letter_index = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

  # The encrypted text goes here.
  encrypted_text = ''

  # Stopping infinite loops.
  counter = 0

  # Sends each character in the input text in to their own element in an array(text_list).
  while counter < input_text.length
    text_list << input_text[counter]
    counter += 1
  end

  # Resets the counter.
  counter = 0

  # Goes through each character in the list.
  while counter < text_list.size
    # Resets the new_letter.
    new_letter = ''

    # Goes through the alphabet for comparison reasons.
    letter_index.each { |x|

      # Error message for: current element in array == nil.
      raise ArgumentError, 'Element must not be nil' if text_list[counter] == nil

      # Checks if current element in text_list is = to currently selected letter in the alphabet.
      if text_list[counter] == x

        # Declares a temporary variable to hold the new offset.
        temp = letter_index.index(text_list[counter]) + offset

        # Makes sure that the offset for a new letter isn't a value that is bigger than the lenght of the alphabet.
        if temp > letter_index.size - 1
          temp = temp - letter_index.size
        end

        # Declares which new letter whom is to be added to the encrypted text.
        new_letter = letter_index[temp]
      end
    }

    # Makes sure to keep spaces so the text don't get messy.
    if new_letter == ''
      new_letter = text_list[counter]
    end

    # Adds the new letter to the end of the encrypted text.
    encrypted_text += new_letter

    # Increments the counter.
    counter += 1
  end

  # Returns the encrypted text.
  return encrypted_text
end

# Public: Decrypts encrypted text using original offset.
#
# input_text  - The string to be decrypted.
#
# offset  - Integer to define how much the text was encrypted.
#
# Examples
#
#   encrypt('KHOOR', 3)
#   # => 'hello'
#
# Returns the input_text decrypted.
def decrypt(input_text, offset)

  # Takes original offset and inverts it.
  offset *= -1

  # Calls the encrypt function using the inverted offset to get the decrypted text, also makes the text lowercase.
  decrypted_text = encrypt(input_text, offset).downcase

  # Returns the decrypted text.
  return decrypted_text
end
