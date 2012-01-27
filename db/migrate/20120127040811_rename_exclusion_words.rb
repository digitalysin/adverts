class RenameExclusionWords < ActiveRecord::Migration
  def self.up
    change_table :site_configurations do |t|
      t.remove :exlucsion_words
      t.text :exclusion_words
    end
  end

  def self.down
    change_table :site_configurations do |t|
      t.remove :exclusion_words
      t.text :exlucsion_words
    end
  end
end
