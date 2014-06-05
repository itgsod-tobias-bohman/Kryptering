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
  raise ArgumentError, 'String must not be empty' if input_text == ''
  raise ArgumentError, 'Offset must not be zero' if offset == 0

  # Makes the input text uppercase letters only.
  input_text = input_text.upcase

  # Defines each letter with a number using index.
  alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

  encrypted_text = ''

  input_text.each_char do |char|

    if alphabet.index(char) == nil
      new_letter = char
    else
        # Declares a temporary variable to hold the new offset.
        temp = alphabet.index(char) + offset

        # Makes sure that the offset for a new letter isn't a value that is bigger than the length of the alphabet.
        if temp > alphabet.size - 1
          temp = temp - alphabet.size
        end

        # Declares which new letter whom is to be added to the encrypted text.
        new_letter = alphabet[temp]
      end
    # Adds the new letter to the end of the encrypted text.
    encrypted_text += new_letter

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

  # Calls the encrypt function using the inverted offset to get the decrypted text, also makes the text lowercase.
  decrypted_text = encrypt(input_text, offset * -1).downcase

  # Returns the decrypted text.
  return decrypted_text
end