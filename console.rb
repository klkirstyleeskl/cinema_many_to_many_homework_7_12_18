require('pry')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

Customer.delete_all
Film.delete_all
Ticket.delete_all

customer_1 = Customer.new({'name' => 'Sir Mixalot', 'funds' => '500.50'})
customer_2 = Customer.new({'name' => 'Poppy Carter', 'funds' => '100.20' })
customer_3 = Customer.new({'name' => 'Dolly Parton', 'funds' => '300.00' })

customer_1.save
customer_2.save
customer_3.save

customer_3.name = "Fred West"
customer_3.update

film_1 = Film.new({ 'title' => 'Coraline', 'price' => '5.99' })
film_2 = Film.new({ 'title' => 'Corpse Bride', 'price' => '10.99' })
film_3 = Film.new({ 'title' => 'Nightmare Before Christmas', 'price' => '1.99' })
film_4 = Film.new({ 'title' => 'Edward Scissorhands', 'price' => '6.99' })

film_1.save
film_2.save
film_3.save
film_4.save

ticket_1 = Ticket.new({'customer_id' => customer_1.id, 'film_id' => film_3.id})
ticket_2 = Ticket.new({'customer_id' => customer_2.id, 'film_id' => film_1.id})
ticket_3 = Ticket.new({'customer_id' => customer_1.id, 'film_id' => film_2.id})
ticket_4 = Ticket.new({'customer_id' => customer_3.id, 'film_id' => film_2.id})
ticket_5 = Ticket.new({'customer_id' => customer_1.id, 'film_id' => film_4.id})
ticket_6 = Ticket.new({'customer_id' => customer_3.id, 'film_id' => film_1.id})

ticket_1.save
ticket_2.save
ticket_3.save
ticket_4.save
ticket_5.save
ticket_6.save

p result = Customer.all

binding.pry
nil
