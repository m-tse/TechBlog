class CreatePageContents < ActiveRecord::Migration
  def change
    create_table :page_contents do |t|
      t.text :content
      t.string :name
      t.timestamps
    end
  end
end
