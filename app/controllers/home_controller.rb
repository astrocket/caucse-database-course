class HomeController < ApplicationController
  def index
    @storage_volume = StorageInfo.all.sum(:allocation_volume)
    @storage_left = StorageInfo.all.sum(:allocation_left)
    @storage_using = StorageInfo.all.sum(:allocation_volume)-StorageInfo.all.sum(:allocation_left)
    @storage_tape_available = ( StorageInfo.where("storage_type = 'TAPE'").sum(:allocation_volume) - ServiceUsing.sum(:tape) - ServiceNotUsing.sum(:tape))
    @storage_san_available =  (StorageInfo.where("storage_type = 'SAN'").sum(:allocation_volume) - ServiceUsing.sum(:san) -ServiceNotUsing.sum(:san))
    @storage_nas_available =  (StorageInfo.where("storage_type = 'NAS'").sum(:allocation_volume) - ServiceUsing.sum(:nas) - ServiceNotUsing.sum(:nas))
    

    
    @Storage_kyung2 = [@storage_volume - @storage_left]
    #@service_using = ServiceUsing.group(:name).sum(:core)
    #@service_notusing = ServiceNotUsing.group(:name).sum(core)
    
    
    @storage_using_san_sum = ServiceUsing.sum(:san)
    @storage_using_nas_sum = ServiceUsing.sum(:nas)
    
    @storage_using_tape_sum = ServiceUsing.sum(:tape)
    @storage_notusing_san_sum = ServiceNotUsing.sum(:san)
    @storage_notusing_nas_sum = ServiceNotUsing.sum(:nas)
    @storage_notusing_tape_sum = ServiceNotUsing.sum(:tape)
    
   @storage_tape_capacity = StorageInfo.where("storage_type = 'TAPE'").sum(:allocation_volume)
   @storage_san_capacity = StorageInfo.where("storage_type = 'SAN'").sum(:allocation_volume)
   @storage_nas_capacity = StorageInfo.where("storage_type = 'NAS'").sum(:allocation_volume)
   
   
   
 
  end
  
end
