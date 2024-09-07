module ApplicationHelper
  def spots_show_page?
    controller_name == 'spots' && action_name == 'show'
  end

  def shops_show_page?
    controller_name == 'shops' && action_name == 'show'
  end

  def schools_show_page?
    controller_name == 'schools' && action_name == 'show'
  end

  def blogs_show_page?
    controller_name == 'blog_pages' && action_name == 'show'
  end
end
