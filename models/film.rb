require_relative('../db/sql_runner')

class Film

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

  def customers()
    sql = "SELECT customers.*
    FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    WHERE tickets.film_id = $1"
    values = [@id]# se agrega el visits. para que sea mas readable pero no es necesario
    customers = SqlRunner.run(sql, values)
    result = customers.map {|customer| User.new(customer)}
    return result
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

  def Film.all
      sql = "SELECT * FROM films;"
      values = []
      film = SqlRunner.run(sql, values)
      result = film.map{|film| Film.new(film)}
      return result
  end
  def customers() # esto es un instance class porque son los locations que ha visitado una sola persona
    sql = "SELECT customers.*
    FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    WHERE tickets.film_id = $1" # esto te dara solo la lista de los locations que esa persona visito sin incluir los nombres de la gente
    values = [@id]
    customers = SqlRunner.run(sql, values)
    result = customers.map {|customer| Customer.new(customer)}
    return result
  end

  def Film.delete_all()
      sql = "DELETE FROM films"
      values = []
      SqlRunner.run(sql, values)
  end


end
