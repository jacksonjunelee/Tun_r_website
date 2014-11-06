# ===============
#    Playlists
# ===============

# INDEX
get '/playlists' do
  @playlists = Playlist.all
  erb :'playlists/index'
end

# SHOW
get '/playlists/:id' do
  @songs = Song.all
  @playlist = Playlist.find(params[:id])
  erb :'playlists/show'
end

# ADD SONG TO PLAYLIST

put '/playlists/:id/add_song' do
  playlist = Playlist.find(params[:id])
  song = Song.find(params[:song_id])
  playlist.songs << song
  redirect "/playlists/#{playlist.id}"
end

put '/playlists/:id/remove_song' do
  playlist = Playlist.find(params[:id])
  playlist.songs.destroy(params[:song_id]) # Remove the song from the playlist, not the db
  redirect "/playlists/#{playlist.id}"
end
