require('pry')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/project')

@@display = "display:none"

get('/')do
  @@display = "display:none"
  @list = Item.all()
  erb(:input)
end

post('/output') do
  name = params.fetch("name")
  rank = params.fetch("rank")
  @@display = "display:none"
  if Item.exist?(name) == true
    @@display = "display:block"
    @list = Item.all()
  else
    @item = Item.new(name, rank)
    @item.add(@item.name, @item.rank)
    @@display = "display:none"
    @list = Item.all()
  end
  erb(:input)
end

post('/sort')do
  @list = Item.sort_by_rank()
  erb(:input)
end

post('/reset')do
  @list = Item.sort_by_id()
  erb(:input)
end

get('/delete/:id') do
  id = params[:id].to_i
  Item.delete(id)
  @list = Item.all()
  erb(:input)
end

get('/edit/:id') do
  @id = params[:id].to_i
  current_item = Item.find(@id)
  @name = current_item[0]
  @rank = current_item[1].to_i
  erb(:edit)
end

post('/update') do
  name = params.fetch("name")
  rank = params.fetch("rank")
  id = params.fetch("id")
  Item.update(name, rank, id.to_i)
  @list = Item.all()
  erb(:input)
end
