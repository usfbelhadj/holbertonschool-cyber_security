require 'socket'

class NetworkScanner
  def initialize(ip_range, port_range)
    @ip_range = ip_range
    @port_range = port_range
  end

  def scan
    @ip_range.each do |ip|
      @port_range.each do |port|
        check_port(ip, port)
      end
    end
  end

  private

  def check_port(ip, port)
    socket = Socket.new(:INET, :STREAM)
    remote_addr = Socket.sockaddr_in(port, ip)

    begin
      socket.connect_nonblock(remote_addr)
        rescue IO::WaitWritable
          if IO.select(nil, [socket], nil, 1)
            begin
              socket.connect_nonblock(remote_addr)
            rescue Errno::EISCONN
              puts "IP: #{ip}, Port: #{port} is open"
            rescue
              # Connection failed
            end
          end
        rescue
          # Connection failed
        ensure
          socket.close
    end
    begin
      socket.connect_block(remote_addr)
        rescue IO::WaitWritable
          if IO.select(nil, [socket], nil, 1)
            begin
              socket.connect_block(remote_addr)
            rescue Errno::EISCONN
              puts "IP: #{ip}, Port: #{port} is open"
            rescue
              # Connection failed
            end
          end
        rescue
          # Connection failed
        ensure
          socket.close
    end
  end
end

# Example usage:
ip_range = ['192.168.1.100', '192.168.1.101', '192.168.1.102']
port_range = (1..1024)
scanner = NetworkScanner.new(ip_range, port_range)
scanner.scan
