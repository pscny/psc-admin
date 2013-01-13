module ApplicationHelper
  def admin_only(&block)
    capture(&block) if current_admin.present?
  end
end
