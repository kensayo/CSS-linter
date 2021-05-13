class Errors
  def initialize
    @file = ''
    @line = []
    @column = []
    @open_bracket = 0
    @break_line = 0
  end

  # @param [Content of Line] line
  # @param [Number of line] line_count
  def error_check(line, line_count)
    case line
    when /{/
      open_bracket(line, line_count)
    when /:/
      line_code(line, line_count)
    when /}/
      closing_bracket(line, line_count)
    when ''
      empty_line(line, line_count)
    when /\w/
      syntax_error(line, line_count)
    end
  end

  private

  def open_bracket(_line, line_number)
    @break_line = 0
    # puts "Single white-space before {" unless line =~ /^(((#|\.)?\w*)|\*)( ((#|\.)?\w+))? {$/
    puts 'Opening bracket'
    if @open_bracket.nonzero?
      puts "Missing closing bracket for line #{@open_bracket}"
      @open_bracket = line_number
    end
    @open_bracket = line_number
  end

  def line_code(_line, _line_number)
    @break_line = 0
    puts "\tCSS line code"
  end

  def closing_bracket(line, line_number)
    @break_line = 0
    puts 'Closing bracket'
    if @open_bracket.zero?
      p line
      puts "Missing opening bracket for line #{line_number}"
      @open_bracket = line_number
    end
    @open_bracket = 0
  end

  def empty_line(_line, line_number)
    puts "Single break line #{@break_line}" if @break_line != 0
    @break_line = line_number
  end

  def syntax_error(_line, line_number)
    puts "CSS Syntax Error #{line_number}"
  end
end
