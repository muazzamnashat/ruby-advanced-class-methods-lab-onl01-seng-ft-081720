class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    name=self.new
    self.all << name 
    name
  end 

  def self.new_by_name(name)
    song=self.new
    song.name= name
    song
  end

  def self.create_by_name (name)
    song=self.new
    song.name=name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name==name}
  end

  def self.find_or_create_by_name (name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical 
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(fileName)
    split= fileName.split(" - ")
    removeMP3= split[1].split(".")
    songName=removeMP3[0]
    artistName=split[0]
    new=self.new
    new.name= songName
    new.artist_name=artistName
    new
  end

  def self.create_from_filename(fileName)
    self.all << self.new_from_filename(fileName)
  end

  def self.destroy_all
    self.all.clear
  end

end
