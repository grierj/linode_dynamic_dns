#!/usr/bin/ruby
require 'cgi'
cgi = CGI.new("html3")
addr = cgi.remote_addr
cgi.out() do
  addr
end
