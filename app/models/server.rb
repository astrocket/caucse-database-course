class Server < ActiveRecord::Base
  validates :number, :location, :spec, :core, presence: true
  before_save :add_volume
  before_destroy :subtract_volume
  
  belongs_to :asset
  
  has_one :box_info, :dependent => :destroy
  has_one :box, through: :box_info, :dependent => :destroy
  
  def add_volume
    if Server.where('number = ?', self.number).exists?
      target_server = Server.where('number = ?', self.number).take

    end
  end
  
  def subtract_volume
    
  end
  
end
