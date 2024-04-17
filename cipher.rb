def change_letter(char,shift)
    alphabet_lowcase =("a".."z").each.with_index(1).to_h
    alphabet_upercase=("A".."Z").each.with_index(1).to_h
    index_of_char=nil
    if alphabet_lowcase.include?(char) || alphabet_upercase.include?(char) 
      index_of_char = char == char.upcase ? alphabet_upercase[char] : alphabet_lowcase[char]
    else return char
    end
    if index_of_char+shift > 26 
      index_of_char = index_of_char+shift-26
    else index_of_char+=shift
    end
    alphabet_lowcase.include?(char) ? alphabet_lowcase.key(index_of_char) : alphabet_upercase.key(index_of_char)
  end
  
  def convert_word_to_cryptic(word,shift)
  array_of_characters = word.split("")
  array_of_characters.map! { |character| change_letter(character,shift)}
  array_of_characters.join('')
  end
  
  def caesar_cipher(string,shift)
  array_of_strings = string.split()
  array_of_strings.map! {|word| convert_word_to_cryptic(word,shift)}
  array_of_strings.join(" ")
  end
  