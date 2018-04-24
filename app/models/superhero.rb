class Superhero < ActiveRecord::Base
  include AlgoliaSearch

  algoliasearch do
    # send all attributes
  end

  def self.gather_heros(params)
    return if params[:q].blank?
    self.search(params[:q], { hitsPerPage: 10 })
  end

end
