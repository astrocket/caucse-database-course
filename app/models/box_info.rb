class BoxInfo < ActiveRecord::Base
    validates :location, :index_start, :name, :box, presence: true

    before_destroy :remove_box_info
    
    belongs_to :box
    belongs_to :switch
    belongs_to :server
    belongs_to :service
    
    private
    
    def add_box_info
            format = *(1..42)
            if format.any? { |value| value.to_s == self.index_start }
                errors.add(:error, '1~42 사이의 index_start 번호를 작성해야합니다.')
                return false
            end
            
            self.box.box_infos.each do |box_info_unit|
                if box_info_unit.index_start == self.index_start
                    if box_info_unit.switch.present?
                        errors.add(:error, '이미 해당 index에 switch 가 존재합니다.')
                        return false
                    elsif box_info_unit.server.present?
                        errors.add(:error, '이미 해당 index에 server 가 존재합니다.')
                        return false
                    end
                end
            end
    end
    
    def remove_box_info
        
    end
end
