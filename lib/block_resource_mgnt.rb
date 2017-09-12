class DatabaseDriver
  def initialize(database, user, password)
    @database = database
    @user = user
    @password = password
    @connected = false
  end

  def connect
    # connects to database
    @connected = true
    puts "Connected to #{@database} as #{@user}."
  end

  def disconnect
    # disconnects from database
    puts "Disconnected."
  end

  def execute(sql)
    raise "Not connected!" unless @connected
    puts "Executing '#{sql}'.."
    # executes SQL
  end

  def transactionally
    puts "Beginning transaction..."
    begin
      yield self
      puts "Committed transaction."
    rescue Exception => e
      puts "Rolled back transaction!"
    end
  end

  def self.open(database, user, password)
    driver = self.new(database, user, password)
    driver.connect

    return driver unless block_given?

    begin
      yield driver
    ensure
      driver.disconnect
    end
  end
end

driver = DatabaseDriver.open("my_database", "admin", "secret")
driver.execute("SELECT * FROM ORDERS")
driver.execute("SELECT * FROM USERS")
driver.disconnect
puts

DatabaseDriver.open("my_database", "admin", "secret") do |driver|
  driver.execute("SELECT * FROM ORDERS 2112")
  driver.execute("SELECT * FROM USERS 2112")
end
puts

DatabaseDriver.open("my_database", "admin", "secret") do |driver|
  driver.transactionally do
    driver.execute("UPDATE ORDERS SET status='completed'")
    raise "BOOM!!"
    driver.execute("DELETE * FROM SHIPPING_QUEUE")
  end
end