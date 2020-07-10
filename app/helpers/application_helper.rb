module ApplicationHelper  
  require "redcarpet"
  require "coderay"
  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
        language = language.split(':')[0]

        case language.to_s
        when 'rb'
            lang = 'ruby'
        when 'yml'
            lang = 'yaml'
        when 'css'
            lang = 'css'
        when 'html'
            lang = 'html'
        when ''
            lang = 'md'
        else
            lang = language
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
    fencedcodeblocks:true,
    highlight: true
  def html(markdown)
    @@markdown.render(markdown).html_safe
  end

end