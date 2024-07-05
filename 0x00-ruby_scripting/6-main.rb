require_relative '5-read_file.rb'
require_relative '6-wirte_in_file.rb'


file1_path = 'file_to_merge.json'
file_path = 'file.json'


merge_json_files(file1_path, file_path)
puts 'File merged successfully!'
count_user_ids_in_json(file_path)
