class Asset < ActiveRecord::Base
    has_many :servers, :dependent => :destroy
    has_many :switches, :dependent => :destroy
    has_many :storages, :dependent => :destroy
    has_many :boxes, :dependent => :destroy
end
