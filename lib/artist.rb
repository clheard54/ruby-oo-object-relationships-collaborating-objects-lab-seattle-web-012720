class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        if self.all.any? {|artist| artist.name == name}
            self.all.detect {|artist| artist.name == name}
        else
            new = Artist.new(name)
        end
    end

    def print_songs
        song_list = self.songs
        song_list.each {|song|
            print song.name + "\n"}
    end

end