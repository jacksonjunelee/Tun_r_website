# ===============
#     Artists
# ===============

# INDEX
get '/artists' do
  @artists = Artist.all
  erb :'artists/index'
end

# SHOW
get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb :'artists/show'
end

# DELETE
delete '/artists/:id' do
  artist = Artist.find(params[:id])
  if artist.destroy
    redirect('/artists')
  else
    redirect("/artists/#{artist.id}")
  end
end
