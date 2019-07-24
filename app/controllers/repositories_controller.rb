class RepositoriesController < ApplicationController
  before_action :load_instances

  def index; end

  def update_data
    repository_manage.update
    redirect_to root_path
  end

  private

  def repository_manage
    RepositoryManage.new
  end

  def load_instances
    @repositories = Repository.per_language
    @repositories_keys = @repositories.keys
  end
end
