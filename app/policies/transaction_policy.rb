class TransactionPolicy < ApplicationPolicy
  
  def initialize(user, transaction)
    @user = user
    @transaction = transaction
  end

  def show?
    user == @transaction.owner
  end


end