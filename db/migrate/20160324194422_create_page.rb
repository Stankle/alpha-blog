class CreatePage < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :description
    end
  end
end
