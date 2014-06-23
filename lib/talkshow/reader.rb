require 'fileutils'
module TalkShow
  class Reader

    def initialize(show_file)
      @show_file = show_file
      @show_dir_name = @show_file.to_s.sub(/\.yml/, "")
      @content = []
      IO.foreach(show_file) { |line| @content << "#{line}" unless line =~ /^#/ }
      @content
    end

    def count
      @file_count = @content.count {|itme| itme =~ /type:/ }
      @file_count.to_i.times { |i|
	File.open("#{i}.tmp", "w")
      }
      @file_count
    end

    def title
      @all_pure_title = []
      @content.each {|item|
      @all_pure_title << item.to_s.sub(/^title: /, "").rstrip if item =~ /^title:/
      }
      if @all_pure_title.size > @all_pure_title.uniq.size
	puts "十分抱歉，标题重复，请更改好之后，再运行脚本！"
        exit
      end
      @all_pure_title
    end

    def picture
      @any_picture = false
      @all_picture = []
      @content.each { |item|
        if item =~ /^picture\d*:/
          @all_picture << item.to_s.sub(/^picture\d*: /,"").rstrip 
          @any_picture = true
        end
      } 
      @all_picture.uniq!
      if @any_picture
        @all_picture.each{|item|
          if File.exist?(item) 
            Dir.mkdir("#{@show_dir_name}/img") unless Dir.exist?("#{@show_dir_name}/img")
            FileUtils.mv "#{item}", "#{@show_dir_name}/img"
	  elsif File.exist?("#{@show_dir_name}/img/#{item}")
	    next
	  else
              puts "图片#{item}还未准备好。请您重新检查。"
              exit
          end
        }
      end
    end
    def create_content
      n = 0
      @content.each { |item|
        if item =~ /^---$/
          n = n + 1
          next
        elsif
          a = File.open("#{n}" + ".tmp", "a")
          a.puts item
          a.close
        end
      }
    end
  end
end
