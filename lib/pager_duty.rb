require 'rubygems'
require 'bundler'
Bundler.require(:default)

module PagerDuty; end

Dir["lib/pager_duty/**/*.rb"].sort.each do |path|
  file_to_require = path.sub(/.rb$/, '').sub(/^lib\//, '')
  require file_to_require
end
