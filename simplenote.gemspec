# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{simplenote}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Simon Jefford"]
  s.date = %q{2010-07-05}
  s.description = %q{Uses HTTParty to present a nice Ruby wrapper for SimpleNote}
  s.email = %q{simon.jefford@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".autotest",
     ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/simplenote.rb",
     "simplenote.gemspec",
     "test/fixtures/create_note.yml",
     "test/fixtures/delete_note_with_bad_key.yml",
     "test/fixtures/get_index.yml",
     "test/fixtures/get_note_with_bad_key.yml",
     "test/fixtures/login_failure.yml",
     "test/fixtures/search.yml",
     "test/fixtures/update_note.yml",
     "test/simplenote_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/simonjefford/simplenote}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Simple wrapper for the SimpleNote HTTP API}
  s.test_files = [
    "test/simplenote_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_runtime_dependency(%q<httparty>, ["= 0.6.0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<httparty>, ["= 0.6.0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<httparty>, ["= 0.6.0"])
  end
end

