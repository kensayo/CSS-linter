require_relative '../lib/files'

RSpec.describe '/lib/files.rb' do
  let(:files) { Files.new }
  context 'When File object is created' do
    it 'on #initialize' do
      expect(files.css_path).to be_instance_of(Array)
    end
  end
  it 'on #return_lines' do
    expect(files.return_lines(files.css_path[0])).to be_instance_of(Array)
  end
end
