# ===============
#     Authors
# ===============

#Index
get '/authors' do
  @author = Author.all
  erb :'authors/index'
end

#New Author 
get '/authors/new' do
  @author = Author.new
  erb:'/authors/new'
end


#Show the Authors
get '/authors/:id' do
  @author = Author.find(params[:id])
  erb :'authors/show'
end

#create an author, redirect
post '/authors' do
  author = Author.new(params[:author])
  if author.save
    redirect("/authors/#{author.id}")
  else
    redirect("/authors/new")
  end
end

# Edit an author
get '/authors/:id/edit' do
  @author = Author.find(params[:id])
  erb :'authors/edit'
end

# Update an author, redirect
put '/authors/:id' do
  @author = Author.find(params[:id])
  if @author.update_attributes!(params[:author])
    redirect("/authors/#{@author.id}")
  else
    redirect("/authors/#{@author.id}/edit")
  end
end

#Delete the Authors, redirect
delete '/authors/:id' do
  author = Author.find(params[:id])
  if author.destroy
    redirect('/authors')
  else
    redirect("/authors/#{author.id}")
  end
end