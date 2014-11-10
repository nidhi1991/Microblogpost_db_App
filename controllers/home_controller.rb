# ===============
#      Home
# ===============

get '/' do
  erb :'home/index'
end

get '/style.css' do
  File.read(File.join('public', 'style.css'))
end
