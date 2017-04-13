class StorageAllocation < ActiveRecord::Base
  validates :allocation, :purpose, presence: true
  before_save :add_volume
  before_destroy :subtract_volume

  belongs_to :service
  belongs_to :storage_info
  
  private
  
  def add_volume
    unless self.storage_info.nil?
      if self.storage_info.allocation_left - self.allocation + 0.001 > 0
        self.storage_info.allocation_left = self.storage_info.allocation_left - self.allocation
        self.storage_info.save
      else
          errors.add(:error, '수용가능한 데이터의 크기를 넘었습니다.')
          return
      end
      
      if self.service.present?
        target_service = self.service.service_using
        target_service_not = self.service.service_not_using
        case self.storage_info.storage_type
        when "SAN"
          if target_service_not.san - self.allocation > 0
            target_service.san = self.allocation + target_service.san
          else
            errors.add(:error, '현재 가용 할당량이 없습니다.')
            return
          end
        when "NAS"
          if target_service_not.nas - self.allocation > 0
            target_service.nas = self.allocation + target_service.nas
          else
            errors.add(:error, '현재 가용 할당량이 없습니다.')
            return
          end
        when "TAPE"
          if target_service_not.tape - self.allocation > 0
            target_service.tape = self.allocation + target_service.tape
          else
            errors.add(:error, '현재 가용 할당량이 없습니다.')
          end
        else
            return
        end
        target_service.save
        target_service_not.save
      end
    end
  end
  
  def subtract_volume
    unless self.storage_info.nil?
      self.storage_info.allocation_left = self.storage_info.allocation_left + self.allocation
      self.storage_info.save
      
      if self.service.present?
        target_service = self.service.service_using
        target_service_not = self.service.service_not_using
        case self.storage_info.storage_type
        when "SAN"
            target_service.san = target_service.san - self.allocation
            target_service_not.san = target_service_not.san + self.allocation
        when "NAS"
            target_service.nas = target_service.nas - self.allocation
            target_service_not.nas = target_service_not.nas + self.allocation
        when "TAPE"
            target_service.tape = target_service.tape - self.allocation
            target_service_not.tape = target_service_not.tape + self.allocation
        else
            return
        end
        target_service.save
        target_service_not.save
      end
      
    end
  end
end
