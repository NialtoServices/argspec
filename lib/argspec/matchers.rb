require 'argspec/matchers/base_matcher'
Dir.glob(File.expand_path('../matchers/**/*.rb', __FILE__)).each { |f| require(f) }
