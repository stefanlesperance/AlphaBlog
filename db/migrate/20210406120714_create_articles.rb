class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      #T.Type :Name
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
