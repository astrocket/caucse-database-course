class Switch < ActiveRecord::Base
  belongs_to :asset
  
  has_one :box_info, :dependent => :destroy
  has_one :box, through: :box_info, :dependent => :destroy
end
