Rails.application.routes.draw do
  scope module: 'cms' do
    post 'mailchimp/subscribe' => 'mailchimp#subscribe', format: true, constraints: { format: :js }, as: :mailchimp

    get 'viewables/new' => 'viewables#create', format: false, as: :new_viewable
    post 'viewables/edit' => 'viewables#update', format: true, constraints: { format: :js }, as: :edit_viewable

    get 'attachments/*directory/:file' => 'attachments#show', format: true

    Viewable::Page.with_url.each do |page|
      get page.url => "pages#show", defaults: { id: page.id, cms_view_type: page.view_name, locale: page.locale }, format: false
    end if ActiveRecord::Base.connection.table_exists? 'viewable_pages'

    Viewable::Form.with_url.each do |form|
      get form.url => "forms#new", defaults: { id: form.id, cms_view_type: form.form_name, locale: form.locale }, format: false
      post form.url => 'forms#create', defaults: { id: form.id, cms_view_type: form.form_name, locale: form.locale }
    end if ActiveRecord::Base.connection.table_exists? 'viewable_forms'

    localized do
      resources :files, format: false, only: [:show]

      Naming::Viewable::Page.names.each do |name|
        get name => 'pages#show', defaults: { cms_view_type: name }, format: false
      end

      Naming::Viewable::Form.names.each do |name|
        get name => 'forms#new', defaults: { cms_view_type: name }, format: false
        post name => 'forms#create', defaults: { cms_view_type: name }
      end
    end
  end
end
