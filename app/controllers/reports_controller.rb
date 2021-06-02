class ReportsController < ApplicationController
    def index
      @transactions = Transaction.all

      @transactions_categories_all_users = Transaction.group(:category).sum(:amount)
      @transactions_categories_current_user = Transaction.where(:owner_id => current_user.id).group(:category).sum(:amount)

      @transactions_amount_current_user = Transaction.where(:owner_id => current_user.id).group(:date).sum(:amount)
      @transactions_amount_all_users = Transaction.group(:date).sum(:amount)

    end

end