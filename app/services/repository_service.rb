class RepositoryService
  SEARCH_ENDPOINT = '/search/repositories'.freeze

  include HTTParty

  base_uri 'https://api.github.com'.freeze

  def initialize(language:)
    @language = language
  end

  def search
    self.class.get(SEARCH_ENDPOINT, query: search_params)
  end

  private

  def search_params
    {
      q: "language:#{@language}",
      sort: 'stars',
      per_page: 5,
      order: 'desc'
    }
  end
end
