require 'pry'

class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
        @artist.add_song(self)

    end


    def self.new_by_filename(file)
        song_data = file.split(' - ')
        song_data[-1].slice! (".mp3")
        song1 = Song.new(song_data[1])
        song1.artist_name= (song_data[0])
        song1
    end

end

