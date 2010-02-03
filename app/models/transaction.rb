# == Schema Information
# Schema version: 20100202035923
#
# Table name: transactions
#
#  id                  :integer(4)      not null, primary key
#  check_number        :string(255)
#  transaction_type_id :integer(4)
#  payee               :string(255)
#  amount              :float
#  cleared             :boolean(1)
#  created_at          :datetime
#  updated_at          :datetime
#

class Transaction < ActiveRecord::Base
  belongs_to :transaction_type
  belongs_to :account
end
