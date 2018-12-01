class Pokemon
  attr_accessor :id, :name, :type, :db 
  
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type 
    @db = db
  end
  
  def self.save(name, type, db)
    insert = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?);")
    insert.execute(name, type)
  end
  
  def self.find(id, db)
    found = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    binding.pry
  end
end
