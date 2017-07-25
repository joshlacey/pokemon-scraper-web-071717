require 'pry'
class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(name:, type:, db:, id:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 60
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (\"#{name}\", \"#{type}\");")
  end

  def self.find(id, db)
    pokie_array = db.execute("SELECT * FROM pokemon WHERE id = #{id};")
    self.new(name: pokie_array[0][1], type: pokie_array[0][2], db: db, id: id)
    #binding.pry
  end



end
