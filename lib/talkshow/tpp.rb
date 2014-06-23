module TalkShow
  class Maker
    def tpp
      f = File.open("#{@every_html["title"]}.html", "w")

      IO.foreach("#{@every_html["title"]}.headmenu") {|line|
        f.puts line
      }

      f.puts "    <div class=\"container-fluid\">"
      f.puts "    </div>  <!-- navbar -->"
      f.puts "    <div class=\"container-fluid\">"
      f.puts "      <div class=\"row\">"
      f.puts "        <div class=\"col-md-12\">"
      f.puts "          <div class=\"row\">"
      f.puts "            <div class=\"dsyj-onefive-title\">"
      f.puts "              <h1>#{@every_html["title"]}</h1>"
      f.puts "            </div>"
      f.puts "            <div class=\"col-md-6\">"
      f.puts "              <div class=\"thumbnail\">"
      f.puts "                <img data-src=\"holder.js\" src=\"img/#{@every_html["picture1"]}\" class=\"img-resposive\">"
      f.puts "              </div>"
      f.puts "              <p align=center>#{@every_html["ptitle1"]}</p>"
      f.puts "            </div>"
      f.puts "            <div class=\"col-md-6\">"
      f.puts "              <div class=\"thumbnail\">"
      f.puts "                <img data-src=\"holder.js\" src=\"img/#{@every_html["picture2"]}\" class=\"img-resposive\">"
      f.puts "              </div>"
      f.puts "              <p align=center>#{@every_html["ptitle2"]}</p>"
      f.puts "            </div>"
      f.puts "          </div>"
      f.puts "        </div>"
      f.puts "      </div>"
      f.puts "    </div> <!-- /.container -->"

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
