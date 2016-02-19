get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

get '/messages/new' do
  @message = Message.new
  erb :'messages/new'
end

post '/messages' do
  @message = Message.new(
    content: params[:content],
    author: params[:author],
    url: params[:url]
  )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end

get '/messages/:id' do
  @message = Message.find params[:id]
  @author_messages = Message.where(author: @message.author).order(created_at: :desc)
  erb :'messages/show'
end
