require_relative 'head_and_menu'
require_relative 'cover'
require_relative 'pcover'
require_relative 'tw'
require_relative 'tp'
require_relative 'ts'
require_relative 'tww'
require_relative 'tpp'
require_relative 'tpw'
require_relative 'tsw'

module TalkShow
  class Maker
    def initialize(every_html, base_info)
      @every_html = every_html
      @base_info = base_info
    end
  end
end
