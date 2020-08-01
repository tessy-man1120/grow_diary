module ApplicationHelper
  require "redcarpet"
  require 'rouge/plugins/redcarpet'
  class HTMLwithCoderay < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
    def block_code(code, language)
      language = language.split(':')[0]

      lang = case language.to_s
             when 'rb'
               'ruby'
             when 'yml'
               'yaml'
             when 'css'
               'css'
             when 'html'
               'html'
             when ''
               'md'
             else
               language
             end

      CodeRay.scan(code, lang).div
    end
  end

  @@markdown = Redcarpet::Markdown.new Redcarpet::Render::HTML,
                                       autolink: true,
                                       space_after_headers: true,
                                       no_intra_emphasis: true,
                                       fenced_code_blocks: true,
                                       tables: true,
                                       hard_wrap: true,
                                       xhtml: true,
                                       lax_html_blocks: true,
                                       strikethrough: true,
                                       fencedcodeblocks: true,
                                       highlight: true
  def html(markdown)
    @@markdown.render(markdown).html_safe
  end
end
