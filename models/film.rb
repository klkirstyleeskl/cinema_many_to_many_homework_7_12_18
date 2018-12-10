require_relative('../db/sql_runner')
require_relative('ticket')
require_relative('customer')

class Film

  attr_reader :id
  attr_accessor :title, :prices


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_f
  end

  def save
      sql = "INSERT INTO films
      (title, price) VALUES ($1, $2) RETURNING ID"
      values = [@title, @price]
      star = SqlRunner.run(sql, values).first
      @id = star['id'].to_i
  end

  def self.all
      sql = "SELECT * FROM films"
      values = []
      films = SqlRunner.run(sql)
      result = locations.map { |film| Film.new( film ) }
      return result
  end

  def self.delete_all()
      sql = "DELETE FROM films"
      values = []
      SqlRunner.run(sql, values)
  end


  def customers()
      sql =  "SELECT customers.* FROM
      customers INNER JOIN tickets ON
      customers.id = tickets.customer_id
      WHERE tickets.film_id = $1"
      values = [@id]
      customers = SqlRunner.run(sql, values)
      return customers.map{ |customer| Customer.new(customer)}
  end

  def viewers()
      return customers.count
  end


end
