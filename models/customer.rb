require_relative('../db/sql_runner')
require_relative('ticket')
require_relative('film')

class Customer

    attr_reader :id
    attr_accessor :name, :funds

    def initialize(options)
      @id = options['id'].to_i if options['id']
      @name = options['name']
      @funds = options['funds'].to_f
    end

    def save
        sql = "INSERT INTO customers
        (name, funds) VALUES ($1, $2) RETURNING ID"
        values = [@name, @funds]
        star = SqlRunner.run(sql, values).first
        @id = star['id'].to_i
    end

    def self.delete_all()
      sql = "DELETE FROM customers"
      values = []
      SqlRunner.run(sql, values)
    end

    def self.all
      sql = "SELECT * FROM customers"
      values = []
      customers = SqlRunner.run(sql, values)
      result = customers.map { |customer| Customer.new( customer ) }
      return result
    end

    def update
    sql = "UPDATE customers
           SET funds = $1,
           name = $2
           WHERE id = $3"
    values = [@funds, @name, @id]
    SqlRunner.run(sql, values)
    end


    #
    # def films()
    #   sql = "SELECT films.* FROM
    #   films INNER JOIN tickets ON
    #   films.id = tickets.film_id
    #   WHERE tickets.customer_id = $1"
    #   values = [@id]
    #   stars = SqlRunner.run(sql, values)
    #   return stars.map{ |film| Film.new(film)}
    # end


end
