module TalkShow
  class Maker
    def head_and_menu(c_title)
      all_pure_title = c_title
      f = File.open("#{@every_html["title"]}.headmenu", "w")
      f.puts "<!DOCTYPE html>"
      f.puts "<html lang=\"en\"> "
      f.puts "  <head>"
      f.puts "    <meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\">"
      f.puts "    <meta charset=\"utf-8\">"
      f.puts "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">"
      f.puts "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
      f.puts "    <meta name=\"description\" content=\"\">"
      f.puts "    <meta name=\"author\" content=\"\">"
      f.puts ""
      f.puts "    <link rel=\"shortcut icon\" href=\"img/book.ico\">"
      f.puts ""
      f.puts "    <title>东山学堂</title>"
      f.puts ""
      f.puts "    <!-- Bootstrap core CSS -->"
      f.puts "    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">"
      f.puts ""
      f.puts "    <!-- Custom styles for this template -->"
      f.puts "    <link href=\"css/cover.css\" rel=\"stylesheet\">" if  %w{cover pcover tp tpp}.include?("#{@every_html["type"]}")
      f.puts "    <link href=\"css/dsyj.css\" rel=\"stylesheet\">"
      f.puts ""
      f.puts "  </head>"
      f.puts ""
      f.puts "  <body>"
      f.puts "    <!-- Menu -->"
      f.puts "    <div class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">"
      f.puts "      <div class=\"container-fluid\">"
      f.puts "        <div class=\"navbar-header\">"
      f.puts "          <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">"
      f.puts "            <span class=\"sr-only\">切换导航</span>"
      f.puts "            <span class=\"icon-bar\"></span>"
      f.puts "            <span class=\"icon-bar\"></span>"
      f.puts "            <span class=\"icon-bar\"></span>"
      f.puts "          </button>"
      f.puts "          <a class=\"navbar-brand\" href=\"#\">#{@base_info["brand"]}</a>"
      f.puts "        </div> <!-- navbar-header -->"
      f.puts "        <div class=\"collapse navbar-collapse\">"
      f.puts "          <ul class=\"nav navbar-nav\">"
      @base_info["nav"].to_a.each{|item|
      f.puts "            <li class=\"active\"><a href=\"#\">#{item}</a></li>"
      }
      f.puts "          </ul>"
      f.puts "          <ul class=\"nav navbar-nav navbar-right\">"
      previous_title_index = all_pure_title.find_index("#{@every_html["title"]}").to_i - 1
      if all_pure_title.find_index("#{@every_html["title"]}").to_i == 0
        f.puts "            <li class=\"disabled\"><a href=\"#\">已经是第一张</a></li>"
      else
        f.puts"             <li><a href=\"#{all_pure_title[previous_title_index]}.html\">上一张</a></li>"
      end
      f.puts "            <li class=\"dropdown\">"
      f.puts "              <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">所有片段<b class=\"caret\"></b></a>"
      f.puts "              <ul class=\"dropdown-menu\">"
      all_pure_title.each{|item|
        if item == @every_html["title"]
          f.puts "                <li class=\"disabled\"><a href=\"#\">#{item.to_s.chomp}</a></li>"
        else
          f.puts "                <li><a href=\"#{item.to_s.chomp}.html\">#{item.to_s.chomp}</a></li>"
        end
      }
      f.puts "                <li class=\"divider\"></li>"
      f.puts "                <li class=\"dropdown-header\">其他提醒</li>"
      f.puts "                <li><a href=\"#\">提醒一</a></li>"
      f.puts "                <li><a href=\"#\">提醒二</a></li>"
      f.puts "              </ul>"
      f.puts "            </li>"
      next_title_index = all_pure_title.find_index("#{@every_html["title"]}").to_i + 1
      if @every_html["title"] == all_pure_title.last
        f.puts "           <li class=\"disabled\"><a href=\"#\">没有了</a></li>"
      else
        f.puts "            <li><a href=\"#{all_pure_title[next_title_index]}.html\">下一张</a></li>"
      end
      f.puts "          </ul>"
      f.puts "        </div><!--/.nav-collapse -->"
      f.puts "      </div> <!-- /container-fluid -->"
      f.puts "    </div>  <!-- navbar -->"
      f.close
    end
  end
end
