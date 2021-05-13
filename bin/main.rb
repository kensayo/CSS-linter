require_relative '../lib/files'
require_relative '../lib/errors'

files = Files.new
errors = Errors.new

files.css_path.each do |file|
  puts "Checking #{file}"
  lines = files.return_lines(file)
  line_count = 1
  lines.each do |line|
    errors.error_check(line, line_count)
    line_count += 1
  end
end
