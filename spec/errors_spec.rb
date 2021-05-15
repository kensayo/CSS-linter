require_relative '../lib/errors'

RSpec.describe '/lib/errors.rb' do
  let(:error) { Errors.new('../CSS-linter/test_files/file_1.css') }
  let(:line1) { 'body {' }
  let(:line2) { '  margin: 20px;' }
  let(:line3) { '#my_id {' }
  let(:line4) { '.my-class a {' }
  let(:line5) { 'class-error{' }
  let(:line6) { '} ' }
  let(:line7) { 'margin: 20px;' }
  let(:line8) { '  border-top: 20px' }

  context 'When Errors object is created' do
    it 'on #initalize' do
      expect(error.file_name).to eq('../CSS-linter/test_files/file_1.css')
    end
  end
  describe '#error_check' do
    context 'When there are no errors in CSS' do
      it 'in Class name' do
        error.error_check(line1, 0)
        expect(error.error.empty?).to be(true)
      end
      it 'on Assignation' do
        error.error_check(line2, 0)
        expect(error.error.empty?).to be(true)
      end
      it 'On ID Name' do
        error.error_check(line3, 0)
        expect(error.error.empty?).to be(true)
      end
      it 'on Class and Element' do
        error.error_check(line4, 0)
        expect(error.error.empty?).to be(true)
      end
    end
    context 'When there are errors in CSS' do
      it 'fails to check class name' do
        error.error_check(line5, 0)
        expect(error.error.empty?).to be(false)
      end
      it 'fails to assignation' do
        error.error_check(line6, 0)
        expect(error.error.empty?).to be(false)
      end
      it 'fails reading filename' do
        error.error_check(line7, 0)
        expect(error.error.empty?).to be(false)
      end
      it 'Fails ' do
        error.error_check(line8, 0)
        expect(error.error.empty?).to be(false)
      end
    end
  end
end
