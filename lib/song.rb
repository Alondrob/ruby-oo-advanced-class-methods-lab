require 'pry'

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
    song_1 = self.new #self represents here the class => refers to the song, 
    #.. if i will change the class name to "Tune" Ruby will still know where to look
    # song_1 = Song.new #=> creates an instance of a song class
    song_1.save # => calling the save method on the new created instance, it creates a new
    #... instance and then passing the instance to the save method (by calling the method on the object)
    #....and the object is being pushed into the @@all array
    return song_1
    
  end

  def self.new_by_name(name)
    song_1 = self.new #=> This comand instentiate a new obkect from the class
    song_1.name = name #=> After instentiation i call the name method on the new 
    #.. object, since i have a name it the attr_accessor i can pass a name variable
    #.. for example Song.new_by_name("Sultans of Swing") will return
    #..<Song:0x00007fffbca02490 @name="Sultans of Swing">
    return song_1
  end


  def self.create_by_name(name)
    song_1 = self.new
    song_1.name = name
    song_1.save

    song_1
  end

  def self.find_by_name(name)
    song_1 = self.new
    @@all.find {|s| s.name == name}
    
  end

    def self.find_or_create_by_name(name)
    #   if Song.find_by_name(name) == nil => calling find_by_name method on the class
    #       Song.create_by_name(name)      # 
    # else
    #   Song.find_by_name(name)
    # end

      if self.find_by_name(name) == nil
        self.create_by_name(name)
      else
        self.find_by_name(name)
      end
  end

   def self.alphabetical
   @@all.sort_by {|song| song.name }
   end
   
   def self.new_from_filename(filename)

    split_filename = filename.chomp(".mp3").split(" - ") #this converts ("Taylor Swift - Blank Space.mp3") into ("Taylor Swift - Blank Space.mp3")
    song_1 = self.new #instatiate the new class instance
    song_1.name = split_filename[1] #calling thr name method on the object and assigning it as a var to the second element of the array
    song_1.artist_name = split_filename[0]
    return song_1
   end


   def self.create_from_filename(filename)

    song_1 = self.new #instatiate the new class instance
    split_filename = filename.chomp(".mp3").split(" - ") #this converts ("Taylor Swift - Blank Space.mp3") into ("Taylor Swift - Blank Space.mp3")
    song_1.name = split_filename[1] #calling thr name method on the object and assigning it as a var to the second element of the array
    song_1.artist_name = split_filename[0]
    song_1.save #calling save method on the object so it will invoke the method and push the new created song into the @all array 

    return song_1
  end

  def self.destroy_all
   @@all.clear
  end












  end

p Song.create_by_name("Summer of 69")
p Song.find_by_name("Summer of 69")
p Song.all