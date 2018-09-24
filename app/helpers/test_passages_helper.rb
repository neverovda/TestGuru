module TestPassagesHelper

  def result(test_passage)
    class_name = test_passage.success? ? 'success' : 'failure'
    content_tag(:p) do 
      content_tag(:span, "Result: ") + 
      content_tag(:b, test_passage.total_percanteges, class: class_name)
    end   
  end

  def progress(test_passage)
    content_tag(:p, 
      "#{test_passage.number_of_current_question} from #{test_passage.amount_questions}")
  end
  
end
