require 'find'

class Files
  attr_reader :css_path

  def initialize
    @css_path = []
    Find.find('../') do |css|
      @css_path.push(css) if css =~ /\.css/
    end
  end

  def return_lines(css_file)
    File.open(css_file).read.split("\n")
  end

  def return_tokens(line)
    line.split(/ /)
  end
end
