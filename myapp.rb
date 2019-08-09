require_relative 'config'
require 'sinatra'
require 'pco_api'

api = PCO::API.new(basic_auth_token: PCO_APP_ID, basic_auth_secret: PCO_SECRET)

get '/' do
  output = "Households:<br />"
  households = api.people.v2.households.get(order: 'name', per_page:100)
  households["data"].each do |household|
    output << household["attributes"]["name"]
    output << "<br />"
  end
  output
end