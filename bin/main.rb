require_relative '../lib/files'

files = Files.new

files.find_files

files.css_path.each { |file| p File.open(file).read }
