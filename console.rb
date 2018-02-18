require_relative('models/ticket.rb')
require_relative('models/customer.rb')
require_relative('models/film.rb')



require('pry-byebug')
# Tickets.delete_all()
Customer.delete_all()
Film.delete_all()



customer1 = Customer.new({'name' => 'Fred', 'funds' => 50})

customer2 = Customer.new({'name' => 'Mary', 'funds' => 100})


film1 = Film.new({'title' => 'Armagedon', 'price' => 10})

film2 = Film.new({'title' => 'Batman returns', 'price' => 12})

#
ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id })

#
# ticket2 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film2.id })
# ticket2.save()
customer1.save()
customer2.save()
film1.save()
film2.save()
# ticket1.save()
binding.pry
nil
