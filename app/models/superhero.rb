class Superhero < ActiveRecord::Base
  include AlgoliaSearch

  algoliasearch do
    # send all attributes 
  end

end
