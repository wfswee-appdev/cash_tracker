# == Schema Information
#
# Table name: transactions
#
#  id         :bigint           not null, primary key
#  amount     :decimal(, )      not null
#  receipt    :string
#  vendor     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint           not null
#
# Indexes
#
#  index_transactions_on_owner_id  (owner_id)
#  index_transactions_on_vendor    (vendor)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Transaction < ApplicationRecord
  belongs_to :owner, class_name: "User"
end
