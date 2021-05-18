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
require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
