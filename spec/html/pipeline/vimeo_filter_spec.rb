require 'spec_helper'

describe HTML::Pipeline::VimeoFilter do
  let(:vimeo_url) { "https://vimeo.com/137266757" }
  let(:markdown_with_vimeo_url) { "[Vimeo](#{vimeo_url})" }
  let(:html_with_vimeo_url) { "<a href=\"#{vimeo_url}\">Vimeo</a>)" }

  it "generates player iframe based on link" do
    expect(described_class.to_html(vimeo_url)).to eq(
      %(<iframe src="//player.vimeo.com/video/137266757?title=0&byline=0&portrait=0" width="440" height="248" frameborder="0"></iframe>)
    )
  end

  it "doens't transform Markdown link" do
    expect(described_class.to_html(markdown_with_vimeo_url)).to eq(markdown_with_vimeo_url)
  end

  it "doens't transform HTML link" do
    expect(described_class.to_html(html_with_vimeo_url)).to eq(html_with_vimeo_url)
  end

  it "does transform link wrapped in a <div>" do
    expect(described_class.to_html("<div>#{vimeo_url}</div>")).to eq(
      %(<div><iframe src="//player.vimeo.com/video/137266757?title=0&byline=0&portrait=0" width="440" height="248" frameborder="0"></iframe></div>)
    )
  end

  it "does transform link after <br>" do
    expect(described_class.to_html("<br>#{vimeo_url}")).to eq(
      %(<br><iframe src="//player.vimeo.com/video/137266757?title=0&byline=0&portrait=0" width="440" height="248" frameborder="0"></iframe>)
    )
  end
end
