require_relative("../db/sql_runner")

class Films

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price  = options['price'].to_i if options['price']
  end

  def save()
    sql = "INSERT INTO films (title, price)
    VALUES ($1, $2)
    RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first # o se puede poner .first. Esto es para poder ver al menos el primer elemento del array
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films
    SET (title,
      price)
      = ($1, $2)
      WHERE id = $3
      ;"
      values = [@title, @price, @id]
      SqlRunner.run(sql,values)
  end

  def Films.all
      sql = "SELECT * FROM films;"
      values = []
      film = SqlRunner.run(sql, values)
      result = film.map{|film| Films.new(film)}
      return result
  end

  def Films.delete_all()
      sql = "DELETE FROM films"
      values = []
      SqlRunner.run(sql, values)
  end


    # def Films.update
    #
    # end

end
