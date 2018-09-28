module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    content_tag(:a, repo, href: "https://github.com/#{author}/#{repo}",
                          target: '_blank')    
  end

  def flash_message(name)
    content_tag :p, flash[name], class: "flash #{name}" if flash[name]
  end 

end
