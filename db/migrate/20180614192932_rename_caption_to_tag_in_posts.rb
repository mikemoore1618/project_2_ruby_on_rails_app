class RenameCaptionToTagInPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :caption, :tag
  end
end
