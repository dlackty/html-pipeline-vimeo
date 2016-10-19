require "html/pipeline"

module HTML
  class Pipeline
    # HTML Filter for Vimeo links.
    #
    # Context options:
    #   :vimeo_width  - width of player
    #   :vimeo_height  - height of player
    #   :vimeo_show_title  - show video title
    #   :vimeo_show_byline  - show user's byline
    #   :vimeo_show_potrait  - show user's portrait
    #   :vimeo_allow_fullscreen  - allow fullscreen
    #   :vimeo_frameborder  - frame border of player
    #
    # This filter does not write additional information to the context.
    class VimeoFilter < TextFilter
      def call
        regex = /(\s|^|<div>|<br>)https?:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/
        @text.gsub(regex) do
          vimeo_id = $3
          close_tag = $1 if ["<div>", "<br>"].include? $1
          width  = context[:vimeo_width] || 440
          height = context[:vimeo_height] || 248
          show_title      = "title=0"    unless context[:vimeo_show_title]
          show_byline     = "byline=0"   unless context[:vimeo_show_byline]
          show_portrait   = "portrait=0" unless context[:vimeo_show_portrait]
          allow_fullscreen = " webkitallowfullscreen mozallowfullscreen allowfullscreen" if context[:vimeo_allow_fullscreen]
          frameborder     = context[:vimeo_frameborder] || 0
          query_string_variables = [show_title, show_byline, show_portrait].compact.join("&")
          query_string    = "?" + query_string_variables unless query_string_variables.empty?

          %{#{close_tag}<iframe src="//player.vimeo.com/video/#{vimeo_id}#{query_string}" width="#{width}" height="#{height}" frameborder="#{frameborder}"#{allow_fullscreen}></iframe>}
        end
      end
    end
  end
end
