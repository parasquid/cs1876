module ApplicationHelper
  def beds(numbeds)
    "<span style='inline; margin: 0 4px 0 24px;'>#{image_tag 'noun_project_1072.svg', size: '18x14' } #{numbeds}</span>".html_safe
  end
  def baths(numbaths)
    "<span style='inline; margin: 0 4px;'>#{image_tag 'noun_project_1718.svg', size: '18x14' } #{numbaths}</span>".html_safe
  end
  def cars(numcars)
    "<span style='inline; margin: 0 4px;'>#{image_tag 'noun_project_4412.svg', size: '18x14' } #{numcars}</span>".html_safe
  end
end
