class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :auhor
      t.text :body

      t.timestamps
    end
  end
end
