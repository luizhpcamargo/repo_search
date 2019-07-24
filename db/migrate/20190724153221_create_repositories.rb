class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories do |t|
      t.integer :ext_id
      t.integer :stars
      t.string :full_name
      t.string :owner
      t.string :language
      t.string :description
      t.boolean :fork
      t.datetime :creation_date
      t.datetime :last_update
      t.datetime :pushed_at
      t.integer :forks
      t.integer :watchers

      t.timestamps
    end
  end
end
