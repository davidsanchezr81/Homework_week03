# require_relative('../db/sql_runner')
#
# class Tickets
#
#   attr_reader :id
#   attr_accessor :customers_id, :films_id
#
#   def initialize( options )
#     @id = options['id'].to_i if options['id']
#     @customers_id = options['customers_id'].to_i
#     @films_id = options['films_id'].to_i
#   end
#
#   def save()
#     sql = "INSERT INTO tickets
#     (
#       customers_id,
#       films_id
#     )
#     VALUES
#     (
#       $1, $2
#     )
#     RETURNING id"
#     values = [@customers_id, @films_id]
#     ticket = SqlRunner.run( sql,values ).first
#     @id = ticket['id'].to_i
#   end
#
# end
