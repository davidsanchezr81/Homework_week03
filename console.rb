require_relative('models/customers.rb')
require_relative('models/films.rb')
# require_relative('models/tickets.rb')


require('pry-byebug')
#
Customers.delete_all()
Films.delete_all()
# Tickets.delete_all()


customer1 = Customers.new({'name' => 'Fred', 'funds' => 50})

customer2 = Customers.new({'name' => 'Mary', 'funds' => 100})


film1 = Films.new({'title' => 'Armagedon', 'price' => 10})

film2 = Films.new({'title' => 'Batman returns', 'price' => 12})


# ticket1 = Tickets.new({ 'customers_id' => customer1.id, 'films_id' => film1.id })
# ticket1.save()
#
# ticket2 = Tickets.new({ 'customers_id' => customer2.id, 'films_id' => film2.id })
# ticket2.save()
customer1.save()
customer2.save()
film1.save()
film2.save()
binding.pry
nil
