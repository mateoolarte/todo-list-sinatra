require 'sinatra'
require 'make_todo'

get '/' do
  @tasks = Tarea.all
  erb :home
end

get '/search' do
  @param_task = params["search_task"]
  @tasks = Tarea.all

  @hola = @tasks.find do |i|
    i["title"] == @param_task
  end

  erb :search
end  

post '/create' do
  Tarea.create("#{params[:name_task]}")
  redirect '/'
end  

patch '/update/:id' do
  Tarea.update(params[:id])
  redirect '/'
end  

delete '/delete/:id' do
  Tarea.destroy(params[:id])
  redirect '/'
end