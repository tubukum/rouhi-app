class ChangeDataShopToThing < ActiveRecord::Migration[5.2]
  def change
    change_column :things, :shop, :string
  end
end
