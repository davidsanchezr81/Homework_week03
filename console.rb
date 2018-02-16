require_relative('models/customers.rb')
# require_relative(models/films.rb)
# require_relative(models/tickets.rb)


require('pry-byebug')
#
# Customers.delete_all()
# Films.delete_all()
# Tickets.delete_all()


customer1 = Customers.new({'name' => ' Fred', 'funds' => 50})


customer1.save()
binding.pry
nil
