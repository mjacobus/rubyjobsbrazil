module CrudFlashMessagerHelper
  def crud_flash(result)
    unless request.xhr?
      result ? set_crud_success_flash : set_crud_error_flash
    end
    result
  end

  def set_crud_success_flash
    flash[:notice] = t('.success', default: t("system.messages.#{params[:action]}.success"))
  end

  def set_crud_error_flash
    flash.now[:alert] = t('.success', default: t("system.messages.#{params[:action]}.error"))
  end
end
