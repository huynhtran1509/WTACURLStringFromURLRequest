Pod::Spec.new do |s|
  s.name         = 'WTACURLStringFromURLRequest'
  s.version      = '0.0.1'
  s.summary      = 'A tool for building a cURL command from an NSURLRequest'
  s.homepage     = 'https://github.com/willowtreeapps/WTACURLStringFromURLRequest'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = 'WillowTree Apps', 'Andrew Carter'
  s.source       = { :git => 'https://github.com/willowtreeapps/WTACURLStringFromURLRequest.git', :commit => '00b6e3edb5627abe239541e27bca2eec3ecf3867' } 
  s.source_files = 'Classes/**/*.{h,m}'
  s.requires_arc = true
end
