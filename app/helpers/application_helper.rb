module ApplicationHelper
  def document_title
    if @title.present?
      "#{@title} - shimo_bukis"
    else
      'shimo_bukis'
    end
  end
end
