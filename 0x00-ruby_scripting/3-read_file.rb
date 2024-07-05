require 'json'

def count_user_ids_in_json(file_path)
  begin
    # Open the file in read mode
    file = File.open(file_path, 'r')

    # Read the entire content of the file
    content = file.read

    parsed = JSON.parse(content)

    user_id_counts = {}

    parsed.each do |item|
      user_id = item["userId"]
      user_id_counts[user_id] = (user_id_counts[user_id] || 0) + 1
    end

    user_id_counts.each do |user_id, count|
      puts "#{user_id}: #{count}"
    end

  rescue => exception
    puts "Error: #{exception.message}"
  ensure
    # Close the file if it was opened
    file.close unless file.nil?
  end
end

# Example usage:
