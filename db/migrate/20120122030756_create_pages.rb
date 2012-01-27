class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.string :meta_keyword
      t.string :meta_content
      t.boolean :enabled
      t.string :model_for

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
