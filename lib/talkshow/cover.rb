module TalkShow
  class Maker

    def cover
      f = File.open("#{@every_html["title"]}.html", "w")

      IO.foreach("#{@every_html["title"]}.headmenu") {|line|
        f.puts line
      }

      f.puts "    <div class=\"site-wrapper\">"
      f.puts "      <div class=\"site-wrapper-inner\">"
      f.puts "        <div class=\"cover-container\">"
      f.puts "          <div class=\"masthead clearfix\" style=\"position: relative; margin-top: 3em;\">"
      f.puts "            <div class=\"inner cover\">"
      f.puts "              <h1 class=\"cover-heading\">#{@every_html["title"]}</h1>"
      s = @every_html["subtitle"].to_a
      s.each{|item|
        f.puts "              <p class=\"lead\">#{item}</p>"
      }
      f.puts "              </p>"
      f.puts "	         </div>  <!-- inner -->"
      f.puts "          </div>  <! --masthead -->"
      f.puts "        </div>  <!-- cover-container -->"
      f.puts "      </div>  <! --site-wrapper-inner-->"
      f.puts "    </div>  <!-- sit-wrapper -->"

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
