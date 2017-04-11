class Box < ActiveRecord::Base
  belongs_to :asset
  
  has_many :box_infos
  has_many :switches, through: :box_infos
  has_many :servers, through: :box_infos
end
