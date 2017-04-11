class Storage < ActiveRecord::Base
  belongs_to :asset
  
  has_many :storage_infos
  has_many :storage_allocations, through: :storage_infos
end
