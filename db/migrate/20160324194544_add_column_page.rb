class AddColumnPage < ActiveRecord::Migration
  def change
    add_column :pages, :created_at, :timestamp
  end
end
