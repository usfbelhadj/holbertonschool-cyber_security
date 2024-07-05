#!/usr/bin/env ruby

require 'digest'

# Function to perform dictionary attack
def dictionary_attack(hashed_password, dictionary_file)
  File.open(dictionary_file, 'r').each_line do |word|
    word.chomp!  # Remove newline characters
    hashed_word = Digest::SHA256.hexdigest(word)

    if hashed_word == hashed_password
      puts "Password cracked! The original password is: #{word}"
      return
    end
  end

  puts "Password not found in the dictionary."
end

# Example usage
if ARGV.length < 2
  puts "Usage: #{File.basename($PROGRAM_NAME)} HASHED_PASSWORD DICTIONARY_FILE"
  exit 1
end

hashed_password = ARGV[0]
dictionary_file = ARGV[1]

dictionary_attack(hashed_password, dictionary_file)
