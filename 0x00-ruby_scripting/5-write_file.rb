require 'json'

def merge_json_files(file1_path, file2_path)
  file1_content = File.read(file1_path)
  array1 = JSON.parse(file1_content)

  file2_content = File.read(file2_path)
  array2 = JSON.parse(file2_content)

  array1.each do |json_object|
    array2 << json_object
  end

  combined_json = JSON.pretty_generate(array2)

  File.write(file2_path, combined_json)

  puts "Merged JSON written to #{file2_path}"
end
