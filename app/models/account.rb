# == Schema Information
# Schema version: 20100202035923
#
# Table name: accounts
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#
require 'mysql_dates'

class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions

  def transactions_by_date_range(start = Time.now.beginning_of_month, finish = Time.now)
    if start.is_a?(String)
      begin
        start = Date.parse(start)
      rescue
        start = Time.now.beginning_of_month
      end
    end
    if finish.is_a?(String)
      begin
        finish = Date.parse(finish)
      rescue
        finish = Time.now
      end
    end
    transactions.find(:all, :conditions => "payment_date > '#{MySQLDates.convert(start)} 00:00:00' and payment_date < '#{MySQLDates.convert(finish + 1.day)} 00:00:00'")
  end
end
