require 'httparty'
Dir[File.dirname(__FILE__) + '/uber/*.rb'].each do |file|
  require file
end
