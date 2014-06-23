require 'yaml'
require 'fileutils'
require_relative 'reader'
# require_relative 'parser'
require_relative 'maker'
module TalkShow
  class Runner
    def initialize(argv)
      @show_file = argv
    end

    def run
      # 生成一个目录，以便最后整理文件。
      show_dir_name = @show_file.to_s.sub(/\.yml/, "")
      Dir.mkdir(show_dir_name) unless Dir.exist?(show_dir_name)
      
      c = TalkShow::Reader.new(@show_file)
      c_t = c.title
      c.picture
      c_c = c.count
      c.create_content

#       p = TalkShow::Parser.new(c_c, c_t)
#       p.parse
      html = []
      0.upto(c_c) {|i|
        html[i] = YAML.load_file("#{i}" + ".tmp")
        File.delete("#{i}.tmp")  # 调试时，可将本行代码注释掉，查看是否正确解析。    
      }
      base_info = html[0].to_h
      html.each{|html_i|
        next if html_i["brand"]
        @every_html = html_i.to_h
        m = TalkShow::Maker.new(@every_html, base_info)
        m.head_and_menu(c_t)
        case @every_html["type"]
        when "cover" then m.cover
        when "pcover" then m.pcover
        when "tp" then m.tp
        when "ts" then m.ts
        when "tw" then m.tw
        when "tpp" then m.tpp
        when "tpw" then m.tpw
        when "tsw" then m.tsw
        when "tww" then m.tww
        else puts "Sorry! 没有这种#{@every_html["type"]}类型的网页，欢迎您新建类型！"
        end
      }

     # 复制css、js文件夹和相应文件到目标文件夹
      FileUtils.cp_r("talkshow/lib/talkshow/css", show_dir_name)
      FileUtils.cp_r("talkshow/lib/talkshow/js", show_dir_name)
      # 将网页文件移动到目标文件夹，并删除相关文件
      c_t.each{|i|
        FileUtils.mv "#{i}.html", show_dir_name
        FileUtils.rm "#{i}.headmenu"
      }
      puts  "good done!" # "恭喜！全部处理完毕！"
  
    end

  end

end
