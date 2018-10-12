class GistQuestionService

  ResultObject = Struct.new(:success?, :gist_hash)

  def initialize(question, client: default_client)
    @question = question
    @test = question.test 
    @client = client
  end

  def call
    result = @client.create_gist(gist_params)
    ResultObject.new(result.html_url.present?, result.id)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GIST_TOKEN'])  
  end

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', 
                          title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")    
  end

end  
