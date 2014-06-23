Gem::Specification.new do |s|
  s.name = "talkshow"
  s.summary = "a simple netpage display system"
  s.description = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.requirements = [ 'ruby2.0 ; yaml' ]
  s.version = "0.0.1"
  s.author = "kinder Ga"
  s.email = "kingder.ga@outlook.com"
  s.homepage = "http://github.com/kiners"
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>=2.0'
  s.files = Dir['**/**']
  s.executables = [ 'talkshow' ]
  s.test_files = Dir["test/test*.rb"]
  s.has_rdoc = false
end
