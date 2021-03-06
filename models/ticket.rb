require_relative('../db/sql_runner')
require_relative('film')
require_relative('customer')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
      @id = options['id'].to_i if options['id']
      @customer_id = options['customer_id'].to_i
      @film_id = options['film_id'].to_i
  end

  def save()
      sql = "INSERT INTO tickets
      (customer_id, film_id) VALUES ($1, $2) RETURNING ID"
      values = [@customer_id, @film_id]
      casting = SqlRunner.run(sql, values).first
      @id = casting['id'].to_i
  end


  def self.delete_all()
      sql = "DELETE FROM tickets"
      values = []
      SqlRunner.run(sql, values)
  end






end
