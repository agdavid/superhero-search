class CreateSuperheros < ActiveRecord::Migration
  def change
    create_table :superheros do |t|
      t.string :name
      t.string :urlslug
      t.string :id_status
      t.string :alignment
      t.string :eye
      t.string :hair
      t.string :sex
      t.integer :appearances
      t.integer :first_appearance
      t.string :universe

      t.timestamps null: false
    end
  end
end
