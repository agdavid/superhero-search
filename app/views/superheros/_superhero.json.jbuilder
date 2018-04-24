json.extract! superhero, :id, :name, :urlslug, :id_status, :alignment, :eye, :hair, :sex, :appearances, :first_appearance, :universe, :created_at, :updated_at
json.url superhero_url(superhero, format: :json)
