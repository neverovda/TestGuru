module QuestionHelper
  
  def qustion_header(verb, test)
    content_tag(:h1, verb + ' ' + test.title.capitalize + ' Question')    
  end

end
