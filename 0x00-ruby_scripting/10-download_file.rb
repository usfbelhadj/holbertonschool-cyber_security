#!/usr/bin/env ruby

require 'open-uri'
require 'uri'
require 'fileutils'

def download_file(url, local_path)
  puts "Downloading file from #{url}..."
  URI.open(url) do |remote_file|
    File.open(local_path, 'wb') do |local_file|
      local_file.write(remote_file.read)
    end
  end
  puts "File downloaded and saved to #{local_path}."
rescue StandardError => e
  puts "Error downloading the file: #{e.message}"
end

# Example usage
if ARGV.length < 2
  puts "Usage: #{File.basename($PROGRAM_NAME)} URL LOCAL_FILE_PATH"
  exit 1
end

url = ARGV[0]
local_path = ARGV[1]

# Ensure the directory exists before writing the file
FileUtils.mkdir_p(File.dirname(local_path))

download_file(url, local_path)
