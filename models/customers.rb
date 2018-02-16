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
end