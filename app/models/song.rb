class Song < ActiveRecord::Base
 belongs_to :artist
 belongs_to :genre
 has_many :notes

 def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    self.save
 end

 def artist_name
  self.artist.name if self.artist
 end

 def note_content=(contents)
    contents.each do |c|
      if !c.blank?
        self.notes.build(content: c)
      end
    end
  end
  

  def note_content
  end

end
