# ===============
#    Microposts
# ===============

#Index
get '/microposts' do
	@microposts = Micropost.all
	erb :'microposts/index'
end

#get to the create new posts page
get '/microposts/new' do
	@micropost = Micropost.new
	@authors = Author.all
	@tags = Tag.all
	erb :'/microposts/new'
end

#showing a post 
get '/microposts/:id' do
	@micropost = Micropost.find(params[:id])
	erb :'microposts/show'
end

#create a post, This will be a form to fill out
post '/microposts' do
	params[:micropost][:tags] = params[:micropost][:tags].map { |x| Tag.find_by_id(x) }
	micropost = Micropost.new(params[:micropost])
	if micropost.save
		redirect("/microposts/#{micropost.id}")
	else
		redirect("/microposts/new")
	end
end

# Edit a post
get '/microposts/:id/edit' do
	@micropost = Micropost.find(params[:id])
	@authors = Author.all
	@tags = Tag.all
	erb :'microposts/edit'
end

# Update a post
put '/microposts/:id' do
	params[:micropost][:tags] = params[:micropost][:tags].map { |x| Tag.find_by_id(x) }
	@micropost = Micropost.find(params[:id])
	if @micropost.update(params[:micropost])
		redirect("/microposts/#{@micropost.id}")
	else
		redirect("/microposts/#{@micropost.id}/edit")
	end
end

# Delete a post
delete '/microposts/:id' do
	@micropost = Micropost.find(params[:id])
	if @micropost.destroy
		redirect('/microposts')
	end
end