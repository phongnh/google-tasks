Gem::Specification.new do |s|
  s.name          = "google-tasks"
  s.version       = "0.0.1"
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Phong Nguyen-Hoai"]
  s.email         = ["nhphong1406@gmail.com"]
  s.summary       = "Ruby Library for Google Tasks API"
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
