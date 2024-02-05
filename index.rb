require 'socket'

server = TCPServer.new('localhost', 3000)

while session = server.accept
  request = session.gets
  puts request # terminal output
 
  session.print "HTTP/1.1 200\r\n"                      # 1 response or header?
  session.print "Content-Type: text/html\r\n"           # 2
  session.print "\r\n"                                  # 3
  session.print "Hello world! The time is #{Time.now}"  # 4 - just body or whole html?
 
  session.close
end

# def parse(request)
#   method, path, version = request.lines[0].split

#   data = {
#     path: path,
#     method: method,
#     headers: parse_headers(request)
#   }

#   puts "--------- START ------------"
#   puts data
#   puts "---------- END -------------"
# end

# def parse_headers(request)
#   headers = {}

#   def normalize(header)
#     header.gsub(":", "").downcase.to_sym
#   end

#   request.lines[1..-1].each do |line|
#     return headers if line == "\r\n"

#     header, value = line.split
#     header        = normalize(header)

#     headers[header] = value
#   end
# end

# loop {
#   client  = server.accept
#   request = client.readpartial(2048)

#   parse(request)
# }
