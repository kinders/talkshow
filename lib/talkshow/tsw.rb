module TalkShow
  class Maker
    def tsw
      f = File.open("#{@every_html["title"]}.html", "w")

      IO.foreach("#{@every_html["title"]}.headmenu") {|line|
        f.puts line
      }

      f.puts "    <div class=\"container-fluid\">"
      f.puts "      <div class=\"row\">"
      f.puts "        <div class=\"col-md-12\">"
      f.puts "          <div class=\"dsyj-onefive-title\">"
      f.puts "            <h1>#{@every_html["title"]}</h1>"
      f.puts "          </div>"
      f.puts "        </div>"
      f.puts "        <div class=\"col-md-7\">"
      f.puts "          <div class=\"table-responsive\">"
      f.puts "            <table class=\"table table-hover table-striped dsyj-onefive-body\">"
      f.puts "              <tr class=\"warning\">"
      table = @every_html["table"].to_a
      table[0].to_s.split(',').each {|th|
        f.puts "                <th>#{th}</th>"
      }
      table.shift
      f.puts "              </tr>"
      table.each{|line|
        f.puts "              <tr>"
        line.to_s.split(',').each{|data|
          f.puts "                <td>#{data}</td>"
        }
        f.puts "              </tr>"
      }
      f.puts "            </table>"
      f.puts "          </div> <!--table-responsive -->"
      f.puts "        </div>"
      f.puts "        <div class=\"col-md-5\">"
      f.puts "          <div class=\"dsyj-onefive-body\">"
      @every_html["word"].each{|line|
        f.puts "             <p>#{line.to_s.chomp}</p>"
      }
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
