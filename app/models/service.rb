class Service < ActiveRecord::Base
    has_one :service_using, :dependent => :destroy
    has_one :service_not_using, :dependent => :destroy
    has_many :box_infos, :dependent => :destroy
    has_many :storage_allocations, :dependent => :destroy
end
