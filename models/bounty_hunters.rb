require("pg")
class BountyHunters
attr_reader :id
attr_accessor :first_name, :last_name, :species, :homeworld, :cashed_in

def initialize(options)
  @id = options["id"].to_i
  @first_name = options ["first_name"]
  @last_name = options ["last_name"]
  @species = options ["species"]
  @homeworld = options ["homeworld"]
  @cashed_in = options ["cash_in"].to_i

end


def save()
  db = PG.connect({dbname: "space_cowboys", host: "localhost"})
  sql = "INSERT INTO bounty_hunters (first_name, last_name, species, homeworld, cash_in)
  VALUES ($1, $2, $3, $4, $5) RETURNING id;"
  values =[@first_name, @last_name, @species, @homeworld, @cash_in]
  db.prepare("save", sql)
  result = db.exec_prepared("save", values)
  db.close()
  @id = result[0]["id"].to_i
end
#
#
#
def update()
  db = PG.connect({dbname: "space_cowboys", host: "localhost"})
  sql = "UPDATE bounty_hunters SET (first_name, last_name, species, homeworld, cashed_in) = ($1, $2, $3, $4, $5) WHERE id = $6"
 values = [@first_name, @last_name, @species, @homeworld, @cash_in, @id]
 db.prepare("update", sql)
 db.exec_prepared("update", values)
 db close()
end
#
def self.all()
  db = PG.connect({dbname: "space_cowboys", host: "localhost"})
  sql = "SELECT * FROM bounty_hunters"
  db.prepare("all", sql)
  hunters = db.exec_prepared("all")
  db.close()
  return hunters.map {|hunters_hash| BountyHunters.new(hunters_hash)}
end


def self.delete_all()
  db = PG.connect({dbname: "space_cowboys", host: "localhost"})
  sql = "DELETE FROM bounty_hunters"
  db.prepare("delete_all", sql)
  db.exec_prepared("delete_all")
  db.close()
end


def delete()
  db =PG.connect({dbname: "space_cowboys", host: "localhost"})
  sql = "DELETE FROM bounty_hunters WHERE id = $1"
  values = [@id]
  db.prepare("delete", sql)
  db.exec_prepared("delete", values)
  db.close()
end




def self.find_by_name(first_name)
    db = PG.connect(:dbname => 'space_cowboys', :host => 'localhost')
    sql = "SELECT * from bounty_hunters WHERE first_name = $1;"
    values = [first_name]
    db.prepare("find_by_name", sql)
    result = db.exec_prepared("find_by_name", values)[0]
    return BountyHunters.new(result)

  end


  def self.find_by_id(id)
      db = PG.connect(:dbname => 'space_cowboys', :host => 'localhost')
      sql = "SELECT * from bounty_hunters WHERE id = $1;"
      values = [id]
      db.prepare("find_by_id", sql)
      result = db.exec_prepared("find_by_id", values)[0]
      return BountyHunters.new(result)

    end

end
