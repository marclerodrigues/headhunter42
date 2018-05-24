module ApplicationHelper
  def current_company
    @_current_company ||= Company.first
  end
end
