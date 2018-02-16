require_relative("../db/sql_runner")

class Customers

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds  = options['funds'].to_i if options['funds']
  end

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

  def Customers.all
    sql = "SELECT * FROM customers"
    values = []
    customer = SqlRunner.run(sql, values)
    result = customer.map { |customer| Customers.new( customer ) } # esto se cancelan porque usamos el metodo de Location.map_items
    return result
  end

  def Customers.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end







end
