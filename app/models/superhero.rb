class Superhero < ActiveRecord::Base
  include AlgoliaSearch

  algoliasearch do
    # send all attributes

    # search specific attributes
    searchableAttributes ['name', 'id_status', 'alignment', 'eye', 'hair', 'sex', 'appearances', 'first_appearance', 'universe']

    # tie breaker for results of equal relevance
    customRanking ['desc(appearances)']
  end

  def self.gather_heros(params)
    return if params[:q].blank?
    self.search(params[:q], { hitsPerPage: 10 })
  end

end
