require 'colorize'

class Errors
  attr_reader :error, :file_name

  def initialize(file_name)
    @file_name = file_name
    @error = []
    @open_bracket = 0
    @previous_line = ''
  end

  # @param [Content of Line] line
  # @param [Number of line] line_count
  def error_check(line, line_count)
    case line
    when /{/ || /:[\w\s-]*{/
      open_bracket(line, line_count)
    when /:/
      line_code(line, line_count)
    when /}/
      closing_bracket(line, line_count)
    when ''
      empty_line(line, line_count)
    when /[\ws]+/
      syntax_error(line, line_count)
    end
    @previous_line = line
  end

  private

  def create_error(message, line, col)
    error_hash = { 'message' => message, 'line' => line, 'col' => col == 1 ? col : (col + 2) }
    @error.push(error_hash)
  end

  def open_bracket(line, line_number)
    if @open_bracket.nonzero?
      create_error('Missing closing bracket', @open_bracket, 1)
      @open_bracket = line_number
    elsif line =~ /\s\s+{$/
      create_error('Unexpected whitespace before {', line_number, line =~ /\s\s+{$/)
    elsif line =~ /{\s+$/
      create_error('Unexpected whitespace after {', line_number, line =~ /{\s+$/)
    elsif (line =~ /^((#|.)?[\w-]*(:[\w-]*)?|\*)(,? ((#|\.)?[\w-]+)(:[\w-]*)?)* {$/).nil?
      create_error('CSS Syntax Error', line_number, 1)
    end
    @open_bracket = line_number
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def line_code(line, line_number)
    create_error('Expected indentation of 2 spaces', line_number, 1) unless line =~ /^\s\s\w/
    create_error('Unexpected whitespace before :', line_number, line =~ /[a-z]\s:/) if line =~ /[a-z]\s:/
    create_error('Expected single whitespace after :', line_number, 1) unless line =~ /:\s[\w|#\-"']/
    create_error('Semicolon at the end on line', line_number, line =~ /\w$/) if line =~ /\w$/
    create_error('Unexpected whitespace before ;', line_number, line =~ /\w\s;$/) if line =~ /\w\s;$/
    create_error('Unexpected whitespace after ;', line_number, line =~ /;\s+$/) if line =~ /;\s+$/
    create_error('Expected single whitespace after ,', line_number, line =~ /,\s\s+/) if line =~ /,\s\s+/
    create_error('Unexpected whitespace before ,', line_number, line =~ /\s+,/) if line =~ /\s+,/
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def closing_bracket(_line, line_number)
    # create_error('Unexpected break12 line', line_number, 1) if @previous_line !~ /:/
    if @open_bracket.zero?
      create_error('Missing opening bracket', line_number, 1)
      @open_bracket = line_number
    end
    @open_bracket = 0
  end

  def empty_line(line, line_number)
    create_error('Expected single break line', line_number, 1) if @previous_line == line
    create_error('Unexpected break line', line_number, 1) if @previous_line =~ /:/
    create_error('Unexpected break line', line_number, 1) if @previous_line =~ /{/
  end

  def syntax_error(_line, line_number)
    create_error('CSS Syntax Error', line_number, 1)
  end

  public

  def print_error
    puts "\nError".to_s.colorize(:red) + ' in file '.to_s + @file_name.colorize(:blue)
    @error.each do |error|
      line_col_error = "\t#{error['line']}:#{error['col']}"
      puts "#{line_col_error.colorize(:yellow)}\t::#{' × '.colorize(:red)} #{error['message']}"
    end
  end
end
