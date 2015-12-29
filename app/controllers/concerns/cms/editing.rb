module CMS
  module Editing
    extend ActiveSupport::Concern

    included do
      before_action :set_edit_mode

      helper_method :edit_mode?
    end

    def edit_mode?
      @_editing ||= RailsAdminCMS::Config.authorized_user_method && session[:edit_mode].to_b
    end

    private

    def set_edit_mode
      session[:edit_mode] = params[:edit_mode] || session[:edit_mode]
    end
  end
end