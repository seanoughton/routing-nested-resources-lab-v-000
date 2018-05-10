class Artist < ActiveRecord::Base
  has_many :songs

  def self.artist_exists?(artist_id)
    #what is the problem i'm trying to solve
      #what happens when the input for this function calls an artist that doesn't exist?
      #when you give find an id number that doesnt' exist you get an RecordNotFound Execption
      #how can you test to see if the record(row) exists in the database
      #Artist.exists?(1)  returns false
      #Artist.exists?(abc) returns undefined local variable
      #Artist.exists?('abc') returns false


    #solve a simpler version of the problem, a smaller instance of the problem
    #do it manually, not in code
    #solve a more complex version manually
    #find the pattern
    #write pseudo code that solves the problem
    #translate the pseudo code into code
    #test it for inputs
    #try to break it with edge case
    #fix edge cases

    #
    where(id: artist_id).first == true
  end
end
