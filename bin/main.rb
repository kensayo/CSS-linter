require_relative '../lib/files'
require_relative '../lib/errors'

files = Files.new
errors = []
i = 0

files.css_path.each do |file|
  puts "Checking #{file}"
  lines = files.return_lines(file)
  line_count = 1
  errors.push(Errors.new(file))
  lines.each do |line|
    errors[i].error_check(line, line_count)
    line_count += 1
  end
  i += 1
end

errors.each do |error|
  if error.error.empty?
    puts "\n#{'No errors'.colorize(:green)} in #{error.file_name.colorize(:magenta)}"
  else
    error.print_error
  end
end
