require 'csv'
require 'pry'

Dir["{models,lib}/**/*.rb"].each do |file|
  require_relative file
end
