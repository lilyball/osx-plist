Gem::Specification.new do |s|
  s.name = %q{osx-plist}
  s.version = "1.0"

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kevin Ballard"]
  s.date = %q{2008-04-25}
  s.description = %q{osx/plist is a Ruby library for manipulating Property Lists natively using the built-in support in OS X.}
  s.email = %q{kevin@sb.org}
  s.extensions = ["ext/plist/extconf.rb"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "ext/plist/extconf.rb", "ext/plist/plist.c", "plist.gemspec", "test/fixtures/xml_plist", "test/suite.rb", "test/test_plist.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://www.github.com/kballard/plist}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["ext"]
  s.rubyforge_project = %q{osx-plist}
  s.rubygems_version = %q{1.0.1}
  s.summary = %q{Property List manipulation for OS X}
  s.test_files = ["test/test_plist.rb"]

  s.add_dependency(%q<hoe>, [">= 1.5.1"])
end
