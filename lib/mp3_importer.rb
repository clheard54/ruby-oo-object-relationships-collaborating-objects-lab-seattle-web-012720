require 'pry'

class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
        Dir[path].select { |e| File.file?(e) }
    end


    def files
        songs = Dir.children(@path)
    end

    def import
        list_of_filenames = self.files
        song_array = []
        
        list_of_filenames.each{ |filename| Song.new_by_filename(filename) }
    end

end


