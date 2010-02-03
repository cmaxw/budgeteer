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
    unless start.is_a?(DateTime)
      begin
        start = Date.parse(start)
      rescue
        start = Time.now.beginning_of_month
      end
    else
      # for some reason, setting the default value isn't sticking
      start = Time.now.beginning_of_month
    end
    unless finish.is_a?(DateTime)
      begin
        finish = Date.parse(finish)
      rescue
        finish = Time.now
      end
    else
      # for some reason, setting the default value isn't sticking
      finish = Time.now
    end
    transactions.find(:all, :include => [:transaction_type], :conditions => "payment_date > '#{MySQLDates.convert(start)} 00:00:00' and payment_date < '#{MySQLDates.convert(finish + 1.day)} 00:00:00'")
  end

  def tally(end_date = 1.day.ago)
    # for some reason, setting the default value isn't sticking
    end_date ||= 1.day.ago
    trans = transactions.find(:all, :include => [:transaction_type], 
      :conditions => "payment_date <= '#{MySQLDates.convert(end_date)} 23:59:59'")
    # TODO: move this into SQL
    total = 0
    trans.each do |transaction|
      if transaction.transaction_type.credit?
        total += transaction.amount
      else
        total -= transaction.amount
      end
    end
    total
  end
end
