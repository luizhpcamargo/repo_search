module RepositoryData
  LANGUAGES = %i[ruby elixir python javascript react]

  def update(query)
    @query = query
    LANGUAGES.each { |language| update_language(language) }
  end

  def update_language(language)
    require 'pry'; binding.pry
    response = JSON.parse(service(language).response.body)
    repo = Repository.find_or_initialize_by(ext_id: response['id'])
    repo.full_name = response['full_name']
    repo.owner = response.dig('owner', 'login')
    repo.description = response['description']
    repo.fork = response['fork'].eql?('true')
    repo.creation_date = response['created_at']
    repo.last_update = response['updated_at']
    repo.pushed_at = response['pushed_at']
    repo.forks = response['forks']
    repo.watchers = response['watchers']
    repo.save
  end

  def service(language)
    RepositoryService.new(language: language, query: @query).search
  end
end
