require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save


    return song

  end

  def self.new_by_name(name)
    song = Song.create
    song.name = name
    

    return song
  end

  def self.all
    @@all
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    return song
  end

  def self.find_by_name(name)
    return self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.create_from_filename(filename)
    attribs = filename.split(' - ')
    name = attribs[0]
    artist = attribs[1]
    song = self.create_by_name(name)
    song.artist_name = artist
  end

  def self.destroy_all
    self.all.clear
  end

  

end

song = Song.create_from_filename("Thundercat - For Love I Come.mp3")
song_match = Song.find_by_name("For Love I Come")

Song.destroy_all
