module MySQLDates
  def self.convert(date)
    date.strftime("%Y-%m-%d")
  end
end