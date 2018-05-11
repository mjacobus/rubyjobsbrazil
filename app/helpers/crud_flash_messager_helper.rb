# frozen_string_literal: true

module CrudFlashMessagerHelper
  def crud_flash(result)
    unless request.xhr?
      result ? set_crud_success_flash : set_crud_error_flash
      yield if result && block_given?
    end
    result
  end

  def set_crud_success_flash
    default = t("recruiter.messages.crud.#{params[:action]}.success")
    flash[:notice] = t('.success', default: default)
  end

  def set_crud_error_flash
    default = t("recruiter.messages.crud.#{params[:action]}.error")
    flash.now[:alert] = t('.success', default: default)
  end
end
