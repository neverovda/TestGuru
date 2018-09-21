module QuestionHelper
  
  def qustion_header(question)
    if question.new_record? 
      verb = 'New'
    else
      verb = 'Edit'
    end    
    content_tag(:h1, "#{verb} #{question.test.title.capitalize} Question")    
  end

end
