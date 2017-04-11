class Server < ActiveRecord::Base
  belongs_to :asset
  
  has_one :box_info
  has_one :box, through: :box_info
end
