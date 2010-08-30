spec = Gem::Specification.new do |s|
	s.name = 'apc4r'
	s.version = '0.1'
	s.date = '2010-08-29'
	s.summary = 'A simple library for accessing power information from an APC UPS device'
	s.email = 'dan.simpson@gmail.com'
	s.homepage = 'http://github.com/dansimpson/apc4r'
	s.description = 'A simple library for accessing power information from an APC UPS device.  Requires apcupsd.'
	s.has_rdoc = true
	
	s.authors = ['Dan Simpson']

	s.files = [
	  'README.markdown',
	  'apc4r.gemspec',
	  'Rakefile',
    'spec/helper.rb',
    'spec/apc4r_spec.rb',
    'spec/apc4r_status_spec.rb',
    'lib/apc4r.rb',
    'lib/apc4r/status.rb'
	]
end