require 'json'
require 'open-uri'
require 'pry'

class SpotifyChart

  attr_reader :base_url

  def initialize
    @base_url = "http://charts.spotify.com/api/charts/"
  end

  def get_url(preference, region)
    # return a string that is the base url + / + preference + / + region + / + latest
    pref_url = "#{@base_url}#{preference}/#{region}/latest"
  end

  def get_json(url)
    # load json given a url here
    # refer to the references if you have questions about this
    JSON.parse(`curl #{url}`)
  end

  def fetch_track_album_artist(music_hash)
    # example music_hash:
    # {  
    #   "tracks" => [  
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"All About That Bass",
    #       "artist_name"  =>"Meghan Trainor",
    #       "album_name"   =>"Title"
    #     },
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"Break Free",
    #       "artist_name"  =>"Ariana Grande",
    #       "album_name"   =>"Break Free"
    #     }
    #   ]
    # }

    # given a hash, like the one above, this method should return a string like:
    # '<track name>' by <artist name> from the <album name>
  
    # the track name, artist name, and album name should be the first track in the
    # tracks array
      
    track = music_hash["tracks"].first
    str = "'#{track["track_name"]}' by #{track["artist_name"]} from the album #{track["album_name"]}"

  end


  def most_streamed(region)
    # call on get_url here, where preference is the string 'most_streamed',
    # and set it equal to a variable

    # call on get_json here, using the string that get_url returns
    
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
    str = get_url("most_streamed", region)

    hsh = get_json(str)

    track = fetch_track_album_artist(hsh)
  end

  def most_shared(region)
    # call no get_url here, where preference is the string 'most_shared',
    # and set it equal to a variable

    # call on get_json here, using the string that get_url returns
    
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
  end

end
