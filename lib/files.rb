require 'find'

class Files

  attr_reader :css_path

  def initialize
    @css_path = []
  end

  def find_files
    Find.find('.') do |css|
      @css_path.push (css) if css =~ /\.css/
    end
  end
end
