class BoxInfo < ActiveRecord::Base
    belongs_to :box
    belongs_to :switch
    belongs_to :server
end
