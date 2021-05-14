require_relative '../lib/files'

RSpec.describe '/lib/errors.rb' do
  let(:error) { Errors.new('../CSS-linter/test_files/file_1.css') }
  context 'When Errors object is created' do
    it 'on #initalize' do
      expect(error.file_name).to eq('../CSS-linter/test_files/file_1.css')
    end
  end
  it 'on #error_check' do
    expect()
  end
end
