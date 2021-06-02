class ReportsController < ApplicationController
    def index
      @transactions = Transaction.all
     
      ### Having trouble getting scope and has_many to work. Using them in combination with the group method the chained filters raise errors. Writing the chained filters the old way worked.

      # *************************
      # Pie chart of current user's percentage of spending by category in current quarter
      # *************************

       total_of_all_current_users_transactions = Transaction.where(:owner_id => current_user.id).where(:date => Date.today.beginning_of_quarter..Date.today.end_of_quarter).group(:category).sum(:amount)

       ### Form of above filter using scope and has_many that raises an error
               # current_user.transactions.this_quarter.build.group(:category).sum(:amount)

      total_of_all_current_users_transactions = total_of_all_current_users_transactions.inject(0) { |total, (k, v)| total + v }
      
      @transactions_categories_current_user_stable = Transaction.where(:owner_id => current_user.id).where(:date => Date.today.beginning_of_quarter..Date.today.end_of_quarter).group(:category).sum(:amount)

      transactions_categories_current_user = Transaction.where(:owner_id => current_user.id).where(:date => Date.today.beginning_of_quarter..Date.today.end_of_quarter).group(:category).sum(:amount)

      transactions_categories_current_user.each { |k,v| transactions_categories_current_user[k] = (v/total_of_all_current_users_transactions)*100 }

      @transactions_categories_current_user = transactions_categories_current_user

      # *************************
      # Pie chart of all users' percentage of spending by category in current quarter
      # *************************

      total_of_all_users_transactions = Transaction.where(:date => Date.today.beginning_of_quarter..Date.today.end_of_quarter).group(:category).sum(:amount)

      total_of_all_users_transactions = total_of_all_users_transactions.inject(0) { |total, (k, v)| total + v }

      @transactions_categories_all_users_stable = Transaction.where(:date => Date.today.beginning_of_quarter..Date.today.end_of_quarter).group(:category).sum(:amount)

      transactions_categories_all_users = Transaction.where(:date => Date.today.beginning_of_quarter..Date.today.end_of_quarter).group(:category).sum(:amount)

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

      @current_user_quarterly_spend_by_category = Transaction.where(:owner_id => current_user.id).group(:category).group_by_quarter(:date).sum(:amount)

      # *************************
      # Current user cumulative spending QTD
      # *************************
      running_total = 0
      @current_user_cumulative_spending_qtd = Transaction
      .where(:owner_id => current_user.id)
      .where(:date => Date.today.beginning_of_quarter..Date.today.end_of_quarter)
      .order(:date)
      .pluck(:date, :amount)
      .map {|x,y| [x, (running_total+=y)]}

      # https://stackoverflow.com/questions/24182829/rails-4-how-to-add-subtract-multiples-of-quarters-to-date

      date = Date.today << (3)
      @current_user_cumulative_spending_last_quarter = Transaction
      .where(:owner_id => current_user.id)
      .where(:date => date.beginning_of_quarter..date.end_of_quarter)
      .order(:date)
      .pluck(:date, :amount)
      .map {|x,y| [x, (running_total+=y)]}


      # https://stackoverflow.com/questions/41501477/rails-running-total-column
      # https://stackoverflow.com/questions/16339632/how-do-i-add-a-cumulative-sum-to-an-array-for-only-one-value
      # https://stackoverflow.com/questions/22154843/create-a-hash-in-rails-where-key-and-value-are-values-from-a-tables-fields

    end

end
