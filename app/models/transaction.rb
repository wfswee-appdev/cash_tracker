# == Schema Information
#
# Table name: transactions
#
#  id         :bigint           not null, primary key
#  amount     :decimal(, )      not null
#  category   :string           default("Lunch"), not null
#  date       :date             not null
#  receipt    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint           not null
#
# Indexes
#
#  index_transactions_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Transaction < ApplicationRecord
  belongs_to :owner, class_name: "User", counter_cache: true

  # add more scopes to facilitate reports
  scope :current_quarter, -> { where(:date => Date.today.beginning_of_quarter..Date.today.end_of_quarter) }
  
  validates :amount, presence: true

end
