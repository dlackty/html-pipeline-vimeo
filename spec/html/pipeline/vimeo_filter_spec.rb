require 'spec_helper'

describe HTML::Pipeline::VimeoFilter do
  let(:vimeo_url) { "https://vimeo.com/137266757" }
  it "generates player iframe based on link" do
    expect(described_class.to_html(vimeo_url)).to eq(
      %(<iframe src="//player.vimeo.com/video/137266757?title=0&byline=0&portrait=0" width="440" height="248" frameborder="0"></iframe>)
    )
  end
end
