require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds  = options['funds'].to_i if options['funds']
  end
  #
  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)[0] # o se puede poner .first. Esto es para poder ver al menos el primer elemento del array
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET name
    = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql,values)
  end

  def Customer.all
    sql = "SELECT * FROM customers"
    values = []
    customer = SqlRunner.run(sql, values)
    result = customer.map { |customer| Customer.new( customer ) } # esto se cancelan porque usamos el metodo de Location.map_items
    return result
  end
  #
  def films() # esto es un instance class porque son los locations que ha visitado una sola persona
    sql = "SELECT films.*
    FROM films
    INNER JOIN tickets
    ON films.id = tickets.film_id
    WHERE tickets.customer_id = $1" # esto te dara solo la lista de los locations que esa persona visito sin incluir los nombres de la gente
    values = [@id]
    films = SqlRunner.run(sql, values)
    result = films.map {|film| Film.new(film)}
    return result
  end

  def Customer.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end







end
