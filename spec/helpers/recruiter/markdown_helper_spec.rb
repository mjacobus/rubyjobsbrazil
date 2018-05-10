# frozen_string_literal: true

require 'rails_helper'

describe Recruiter::MarkdownHelper, type: :helper do
  def render(text)
    helper.to_markdown(text)
  end

  describe '#to_markdown' do
    it 'renders markdown' do
      expect(helper.to_markdown('# text')).to match('<h1>text</h1>')
    end

    it 'renders safe html' do
      unsafe_html = [
        '<script>alert("")</script>'
      ]
      unsafe_html.each do |html|
        expect(helper.to_markdown(html)).not_to include(html)
      end
    end

    xit "won't enhance inner underscores" do
      expect(render('ab_cd_ef')).not_to match '<em>'
    end

    xit 'renders single line break' do
      expect(render("line\nbreake")).to match "line<br>\nbreak"
    end

    describe '#block_code' do
      it 'shows nice language specific block code' do
        markdown = <<~EOF
          ```ruby
          puts "ruby"
          ```
EOF
        expect(render(markdown)).to match '<pre class="rb prettyprint">'
      end
    end
  end
end
