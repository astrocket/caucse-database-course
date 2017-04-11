class Asset < ActiveRecord::Base
    has_many :servers
    has_many :switches
    has_many :storages
    has_many :boxes
end
