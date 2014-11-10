# ===============
#    Tags
# ===============

get '/tags' do
  @tags = Tag.all
  erb :'tags/index'
end

get '/tags/delete/:id' do
  @tag = Tag.find(params[:id])
  @tag.destroy
  redirect('/tags')
end

# SEARCH
get '/tags/search' do
  erb :'tags/search'
end

get '/tags/search/:term' do
  @microposts = Tag.where('name LIKE ?', "%#{params[:term]}%").map { |x| x.microposts }.flatten.uniq
  erb :'tags/search'
end

post '/tags/search' do
  @microposts = Tag.where('name LIKE ?', "%#{params[:term]}%").map { |x| x.microposts }.flatten.uniq
  erb :'tags/search'
end