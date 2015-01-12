# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name    = "sinatra-aws-s3"
  s.version = "0.0.1"
  s.date    = "2015-01-12"
  s.summary = "Sinatra app to pre sign s3 http posts"
  s.authors = ["Anthony Byram"]
  s.email   = "anthony@namelessnotion.com"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('sinatra')
  s.add_dependency('sinatra_warden')
  s.add_dependency('json')
  s.add_dependency('aws-s3')
  s.add_dependency('ruby-hmac')

end
