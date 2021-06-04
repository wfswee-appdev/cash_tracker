class ReportsController < ApplicationController
    def index
      @transactions = Transaction.all
     
      ### Having trouble getting scope and has_many to work. Using them in combination with the group method the chained filters raise errors. Writing the chained filters the old way worked.

      # *************************
      # Pie charts of current user's and team's spending by category in current quarter. Need to calc % of spend and $ amounts to display % on pie chart and display hard $ amounts under pie chart.
      # *************************

      total_of_all_current_users_transactions = 
      current_user
      .transactions
      .current_quarter
      .group(:category)
      .sum(:amount)

      total_of_all_current_users_transactions = total_of_all_current_users_transactions.inject(0) { |total, (k, v)| total + v }
      
      @transactions_categories_current_user_stable = 
      current_user
      .transactions
      .current_quarter
      .group(:category)
      .sum(:amount)

      transactions_categories_current_user = 
      current_user
      .transactions
      .current_quarter
      .group(:category)
      .sum(:amount)

      transactions_categories_current_user.each { |k,v| transactions_categories_current_user[k] = (v/total_of_all_current_users_transactions)*100 }

      @transactions_categories_current_user = transactions_categories_current_user

      # *************************
      # Pie charts showing percentage of spending by category in current quarter for user and team
      # *************************

      total_of_all_users_transactions = 
      Transaction
      .current_quarter
      .group(:category)
      .sum(:amount)

      total_of_all_users_transactions = 
      total_of_all_users_transactions
      .inject(0) { |total, (k, v)| total + v }

      @transactions_categories_all_users_stable = 
      current_user
      .transactions
      .group(:category)
      .sum(:amount)

      transactions_categories_all_users = 
      current_user
      .transactions
      .group(:category)
      .sum(:amount)

      transactions_categories_all_users.each { |k,v| transactions_categories_all_users[k] = (v/total_of_all_users_transactions)*100 }

      @transactions_categories_all_users = transactions_categories_all_users

      # *************************
      # Line chart of all current user's spending by quarter since inception
      # *************************

      @transactions_amount_current_user = 
      current_user
      .transactions
      .group_by_quarter(:date)
      .sum(:amount)

      # *************************
      # Line chart of all users' spending by quarter since inception
      # *************************

      @transactions_amount_all_users = 
      Transaction
      .group_by_quarter(:date)
      .sum(:amount)

      # *************************
      # Line chart of current user's spending by category by quarter since inception
      # *************************

      @current_user_quarterly_spend_by_category = 
      current_user
      .transactions
      .group(:category)
      .group_by_quarter(:date)
      .sum(:amount)

      # *************************
      # Current user cumulative spending QTD
      # *************************
      running_total = 0
      @current_user_cumulative_spending_qtd = 
      current_user
      .transactions
      .current_quarter
      .order(:date)
      .pluck(:date, :amount)
      .map {|x,y| [x, (running_total+=y)]}

      # *************************
      # Current user cumulative spending prior quarter
      # *************************

      @current_user_cumulative_spending_last_quarter = 
      current_user
      .transactions
      .prior_quarter
      .order(:date)
      .pluck(:date, :amount)
      .map {|x,y| [x, (running_total+=y)]}

    end

end
