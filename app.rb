require('pry')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/project')


get('/')do
  erb(:input)
end

post('/output') do

  name = params.fetch("name")
  rank = params.fetch("rank")
  @item = Item.new(name, rank)
  @item.add(@item.name, @item.rank)
  erb(:output)
end
