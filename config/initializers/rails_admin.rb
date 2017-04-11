RailsAdmin.config do |config|
  config.total_columns_width = 1200
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
    dashboard # mandatory
    index # mandatory
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
      field :number do
        label '자 산 번 호'
      end
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
      exclude_fields :created_at, :updated_at
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
      exclude_fields :created_at, :updated_at
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
      exclude_fields :created_at, :updated_at
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
      exclude_fields :created_at, :updated_at
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
      exclude_fields :created_at, :updated_at
    end
  end

  config.model 'BoxInfo' do
    label '랙(정보)'
    parent Box
    object_label_method do
      :name_label_method
    end

    list do
      items_per_page 42

      field :location do
        label '위치'

      end
      field :box do
        label 'Rack(랙)'
      end
      field :index_start do
        label '인덱스'
      end
      field :ip do
        label 'IP'
      end
      field :server do
        label '서버'
      end
      field :switch do
        label '스위치'
      end
      field :service_using do
        label '서비스명'
      end
      exclude_fields :created_at, :updated_at
    end
  end

  config.model 'ServiceUsing' do
    label '서비스(사용중)'
    object_label_method do
      :name_label_method
    end

    list do
      field :name do
        label '이름'
      end
      field :core do
        label 'core'
      end
      field :san do
        label 'san'
      end
      field :nas do
        label 'nas'
      end
      field :tape do
        label 'tape'
      end
      field :storage_allocations do
        label do
          self.box_infos
        end
      end
      exclude_fields :created_at, :updated_at
    end
  end


  config.model 'ServiceNotUsing' do
    label '서비스(사용대기)'
    object_label_method do
      :name_label_method
    end

    list do
      field :name do
        label '이름'
      end
      field :core do
        label 'core'
      end
      field :san do
        label 'san'
      end
      field :nas do
        label 'nas'
      end
      field :tape do
        label 'tape'
      end
      exclude_fields :created_at, :updated_at
    end
  end


  config.model 'StorageInfo' do
    label '스토리지 인포'
    parent Storage
    object_label_method do
      :name_label_method
    end

    list do
      field :name do
        label '이름'
      end
      field :registration_date do
        label '등록일자'
      end
      field :disk_capacity do
        label '디스크사양'
      end
      field :storage_type do
        label '형 식'
      end
      field :allocation_unit do
        label '할당단위크기(GB)'
      end
      field :allocation_volume do
        label 'VOL(TB)'
      end
      field :allocation_left do
        label '가용량(TB)'
      end
      exclude_fields :created_at, :updated_at
    end
  end

  config.model 'StorageAllocation' do
    label '스토리지 할당량'
    parent Storage
    object_label_method do
      :purpose_label_method
    end

    list do
      field :storage_info do
        label "제품명"
      end
      field :purpose do
        label "용도"
      end
      field :service_using do
        label "서비스명"
      end
      field :allocation do
        label "할당량 (TB)"
      end
      exclude_fields :created_at, :updated_at
    end
  end


  private

  def number_label_method
    self.number
  end

  def name_label_method
    self.name
  end

  def purpose_label_method
    self.purpose
  end
end
