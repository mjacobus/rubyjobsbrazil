require 'spec_helper'

describe MarkdownHelper do
  describe "#to_markdown" do
    it "renders markdown" do
      expect(helper.to_markdown('# text')).to match('<h1>text</h1>')
    end

    it "renders safe html" do
      unsafe_html = [
        '<script>alert("")</script>'
      ]
      unsafe_html.each do |html|
        expect(helper.to_markdown(html)).not_to match(html)
      end
    end
  end
end
