module GrapeDevise
end

require 'grape'
require "grape_devise/api"

Grape::API.extend GrapeDevise::API