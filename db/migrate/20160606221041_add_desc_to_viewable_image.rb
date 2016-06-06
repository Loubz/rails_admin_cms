class AddDescToViewableImage < ActiveRecord::Migration
  def change
    add_column :viewable_images, :text, :text
  end
end
