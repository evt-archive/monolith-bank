class Account < ActiveRecord::Base
  has_many :funds_transfers, :foreign_key => :from_id
  
  has_paper_trail
end
