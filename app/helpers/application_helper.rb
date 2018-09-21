module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    content_tag(:a, repo, href: "https://github.com/#{author}/#{repo}",
                          target: '_blank')    
  end

end
