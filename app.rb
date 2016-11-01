require "active_record"
require "pry"
require_relative "models/apartment"
require_relative "models/tenant"
require_relative "db/connection"

require "sinatra"
require "sinatra/reloader"



get '/apartments' do
  @apartments = Apartment.all
  erb :'apartments/index'
end

get '/apartments/new' do
  erb :'apartments/new'
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :'apartments/edit'
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  erb :'apartments/show'
end

get '/apartments/:id/tenants' do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  erb :'tenants/index'
end

post '/apartments' do
  puts params[:apartment]
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

put '/apartments/:id' do

end
