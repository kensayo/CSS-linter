require_relative '../lib/files'
require_relative '../lib/errors'

files = Files.new
errors = Errors.new
lines = []
tokens = []

files.css_path.each do |file|
  puts "Checking #{file}"
  lines = files.return_lines(file)
  lines.each do |line|
    p line.split(/(?<= )/)
  end
end

