require('pry')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/project')


get('/')do
  @list = Item.all()
  erb(:input)
end

post('/output') do

  name = params.fetch("name")
  rank = params.fetch("rank")
  @item = Item.new(name, rank)
  @item.add(@item.name, @item.rank)
  @list = Item.all()
  erb(:input)
end

post('/delete/:id') do
  id = params[:id]
  Item.delete(id)
  @list = Item.all()
  erb(:input)
end
