module AccountsHelper
  def adjust_total(running_total, transaction)
    if transaction.transaction_type.credit?
      running_total = running_total + transaction.amount
    else
      running_total = running_total - transaction.amount
    end
    running_total
  end
end
