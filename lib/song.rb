require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name = nil, artist_name = nil)
  # 	@name = name
  # 	@artist_name = artist_name
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  	#binding.pry
  	self.new.save
  	self.all[-1]
  end

  def self.new_by_name(name)
  	#binding.pry
  	#self.new(name)
  	song = self.new
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	# @@all << self.new(name)
  	# @@all[-1]
  	song = self.create
  	song.name = name
  	song
  end

  def self.find_by_name(name)
  	self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	if self.find_by_name(name)
  		self.find_by_name(name)
  	else
  		self.create_by_name(name)
  	end
  end

  def self.alphabetical
  	self.all.sort_by do |song|
  		song.name
  	end
  end

  def self.new_from_filename(file)
  	artist = file.split(" - ")[0]
  	name = file.split(/[-.]/)[1][1..-1]
  	song = self.new_by_name(name)
  	song.artist_name = artist
  	song
  end

  def self.create_from_filename(file)
  	artist = file.split(" - ")[0]
  	name = file.split(/[-.]/)[1][1..-1]
  	song = self.create_by_name(name)
  	song.artist_name = artist
  	song
  end

  def self.destroy_all
  	@@all = []
  end



end
