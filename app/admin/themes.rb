# encoding: utf-8
ActiveAdmin.register Theme do

  index do
    column :id
    column :name
    column :style
    column :color
    column :price
    default_actions
  end

  form html: { :enctype => "multipart/form-data" } do |f|
    f.inputs "基本信息" do
      f.input :published
      f.input :position
      f.input :name
      f.input :handle      , hint: '英文名称'
      f.input :style
      f.input :style_handle, hint: '风格的英文名称，主题只有一个风格时，输入default'
      f.input :role        , as: :radio          , collection: KeyValues::Theme::Role.options
      f.input :price
      f.input :color       , as: :radio          , collection: Theme::COLOR
      f.input :desc        , as: :text           , input_html: { rows: 10 }
    end
    f.inputs "作者信息" do
      f.input :shop
      f.input :site  , as: :url
      f.input :author
      f.input :email , as: :email
    end
    f.inputs "相关文件" do
      f.input :file, as: :file, hint: '请上传tar.bz2文件，注意不要有顶级目录，解压包下直接放layouts,assets,config,snippets,templates目录'
      f.input :main, as: :file, hint: 'main(500x642)'
      f.input :collection, as: :file, hint: 'collection(850x600)'
      f.input :product, as: :file, hint: 'product(850x600)'
    end
    f.buttons
  end

end
