class RepositoryManage
  LANGUAGES = %i[ruby elixir python javascript go].freeze

  def update
    LANGUAGES.map { |language| update_language(language) }
  end

  private

  def update_language(language)
    response = JSON.parse(service(language).response.body)
    items = response['items']

    return if items.blank?

    assign_values(items: items, language: language)
  end

  def assign_values(items:, language:)
    items.map do |item|
      repo = Repository.find_or_initialize_by(ext_id: item['id'])
      repo.assign_attributes(
        stars: item['stargazers_count'],
        full_name: item['full_name'],
        owner: item.dig('owner', 'login'),
        description: item['description'],
        language: language,
        fork: item['fork'].eql?('true'),
        creation_date: item['created_at'],
        last_update: item['updated_at'],
        pushed_at: item['pushed_at'],
        forks: item['forks'],
        watchers: item['watchers']
      )

      repo.save
    end
  end

  def service(language)
    RepositoryService.new(language: language).search
  end
end
