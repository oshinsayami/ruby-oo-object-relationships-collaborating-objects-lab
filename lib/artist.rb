require "pry"
class Artist
    attr_accessor :name, :songs
    @@all = []


    def initialize(name)
        @name= name
        save
    end

    def self.all
        @@all
    end

    def add_song(song)
       song.artist = self
    end

    def save
        @@all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(artist_name)
        self.find(artist_name) ?self.find(artist_name) : self.new(artist_name)
    end

    def self.find(name)
        self.all.find{|artist| artist.name == name}
    end

    def print_songs
        songs.each {|x| puts x.name}
    end

#  binding.pry
end