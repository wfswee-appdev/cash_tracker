class ReportsController < ApplicationController
    def index
      @transactions = Transaction.all
     
      # *************************
      # Pie chart of current user's percentage of spending by category in current quarter
      # *************************

      total_of_all_current_users_transactions = Transaction.where(:owner_id => current_user.id).where(:date => Date.today.beginning_of_quarter..Date.today.end_of_quarter).group(:category).sum(:amount)
      # Old version of this filter that didn't restrict transactions to the current quarter
      # total_of_all_current_users_transactions = Transaction.where(:owner_id => current_user.id).group(:category).sum(:amount)

      total_of_all_current_users_transactions = total_of_all_current_users_transactions.inject(0) { |total, (k, v)| total + v }
      
      @transactions_categories_current_user_stable = Transaction.where(:owner_id => current_user.id).where(:date => Date.today.beginning_of_quarter..Date.today.end_of_quarter).group(:category).sum(:amount)
      # Old version of this filter that didn't restrict transactions to the current quarter
      # @transactions_categories_current_user_stable = Transaction.where(:owner_id => current_user.id).group(:category).sum(:amount)

      transactions_categories_current_user = Transaction.where(:owner_id => current_user.id).where(:date => Date.today.beginning_of_quarter..Date.today.end_of_quarter).group(:category).sum(:amount)
      # Old version of this filter that didn't restrict transactions to the current quarter
      # transactions_categories_current_user = Transaction.where(:owner_id => current_user.id).group(:category).sum(:amount)

      transactions_categories_current_user.each { |k,v| transactions_categories_current_user[k] = (v/total_of_all_current_users_transactions)*100 }

      @transactions_categories_current_user = transactions_categories_current_user

      # *************************
      # Pie chart of all users' percentage of spending by category in current quarter
      # *************************

      total_of_all_users_transactions = Transaction.where(:date => Date.today.beginning_of_quarter..Date.today.end_of_quarter).group(:category).sum(:amount)
      # Old version of this filter that didn't restrict transactions to the current quarter
      # total_of_all_users_transactions = Transaction.group(:category).sum(:amount)

      total_of_all_users_transactions = total_of_all_users_transactions.inject(0) { |total, (k, v)| total + v }

      @transactions_categories_all_users_stable = Transaction.where(:date => Date.today.beginning_of_quarter..Date.today.end_of_quarter).group(:category).sum(:amount)
      # Old version of this filter that didn't restrict transactions to the current quarter
      # @transactions_categories_all_users_stable = Transaction.group(:category).sum(:amount)

      transactions_categories_all_users = Transaction.where(:date => Date.today.beginning_of_quarter..Date.today.end_of_quarter).group(:category).sum(:amount)
      # Old version of this filter that didn't restrict transactions to the current quarter
      # transactions_categories_all_users = Transaction.group(:category).sum(:amount)

      transactions_categories_all_users.each { |k,v| transactions_categories_all_users[k] = (v/total_of_all_users_transactions)*100 }

      @transactions_categories_all_users = transactions_categories_all_users

      # *************************
      # Line chart of all current user's spending by quarter since inception
      # *************************

      @transactions_amount_current_user = Transaction.where(:owner_id => current_user.id).group_by_quarter(:date).sum(:amount)

      # *************************
      # Line chart of all users' spending by quarter since inception
      # *************************

      @transactions_amount_all_users = Transaction.group_by_quarter(:date).sum(:amount)

      # *************************
      # Line chart of current user's spending by category by quarter since inception
      # *************************

      @current_user_quarterly_spend_by_category = Transaction.where(:owner_id => current_user.id).group(:category).group_by_quarter(:date).count

      # *************************
      # Current user cumulative spending QTD
      # *************************

      
    end

end
