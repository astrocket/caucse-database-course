class Storage < ActiveRecord::Base
  belongs_to :asset
  has_many :storage_infos
end
