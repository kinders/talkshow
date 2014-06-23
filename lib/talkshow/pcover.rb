module TalkShow
  class Maker
    def pcover(evry_html)
      f = File.open("#{@every_html["title"]}.html", "w")

      IO.foreach("#{@every_html["title"]}.headmenu") {|line|
        f.puts line
      }

      f.puts "    <img src=\"img/#{@every_html["picture"]}\" class=\"img-resposive\" style=\"width: 100%; height: 100%; position: relative;\">"

      f.puts "    <!-- Bootstrap core JavaScript"
      f.puts "    ================================================== -->"
      f.puts "    <!-- Placed at the end of the document so the pages load faster -->"
      f.puts "    <script src=\"js/jquery.min.js\"></script>"
      f.puts "    <script src=\"js/holder.min.js\"></script>"
      f.puts "    <script src=\"js/bootstrap.min.js\"></script>"
      f.puts "  </body>"
      f.puts "</html>"
      f.close
    end
  end
end
