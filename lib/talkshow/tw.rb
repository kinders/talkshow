module TalkShow
  class Maker

    def tw
      f = File.open("#{@every_html["title"]}.html", "w")

      IO.foreach("#{@every_html["title"]}.headmenu") {|line|
        f.puts line
      }

      f.puts "    <div class=\"container-fluid\">"
      f.puts "      <div class=\"row\">"
      f.puts "        <div class=\"col-md-10 col-md-offset-1\">"
      f.puts "          <div class=\"dsyj-onefive-title\">"
      f.puts "            <h1>#{@every_html["title"]}</h1>"
      f.puts "          </div>"
      f.puts "          <div class=\"dsyj-onefive-body lead\">"
      w = @every_html["word"].to_a
      w.each{|item|
        f.puts "             <p>#{item.to_s.chomp.rstrip}</p>"
      }
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
