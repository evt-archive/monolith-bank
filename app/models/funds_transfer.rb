class FundsTransfer < ActiveRecord::Base
  belongs_to :from, class_name: 'Account'
  belongs_to :to, class_name: 'Account'
end
