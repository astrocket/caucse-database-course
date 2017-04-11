RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  
  end

  
  config.model 'Asset' do
    label '자산(Asset)'
    object_label_method do
      :number_label_method
    end
    
    list do
      field :name do
        label '이름'
      end
      field :servers do
        label '서 버'
      end
      field :switches do
        label '스위치'
      end
      field :storages do
        label '스토리지'
      end
      field :boxes do
        label '랙'
      end
    end
    
  end
  
  
  config.model 'Server' do
    label '서버(Server)'
    parent Asset
    object_label_method do
      :number_label_method
    end
    list do
      field :asset do
        label '자산번호'
      end
      field :number do
        label '관리번호 '
      end
      field :location do
        label '위치 '
      end
      field :spec do
        label '관리규격'
      end
    end
    
  end
 
  
  config.model 'Switch' do
    label '스위치(Switch)'
    parent Asset
    object_label_method do
      :number_label_method
    end
        list do
          field :asset do
            label '자산번호'
          end
      field :number do
        label '관리번호 '
      end
      field :location do
        label '위치 '
      end
      field :spec do
        label '관리규격'
      end
    end
  end
  
  config.model 'Storage' do
    parent Asset
    label '스토리지(Storage)'
    object_label_method do
      :number_label_method
    end
        list do
            field :asset do
            label '자산번호'
          end
      field :number do
        label '관리번호 '
      end
      field :location do
        label '위치 '
      end
      field :spec do
        label '관리규격'
      end
    end
  end
  
  config.model 'Box' do
    label '랙(Rack)'
    parent Asset
    object_label_method do
      :number_label_method
    end
        list do
          field :asset do
            label '자산번호'
          end
      field :number do
        label '관리번호 '
      end
      field :location do
        label '위치 '
      end
      field :spec do
        label '관리규격'
      end
    end
  end
  
  private
  
  def number_label_method
    self.number
  end
  
end
