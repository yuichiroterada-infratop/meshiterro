class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.integer :post_image_id
      t.string :shop_name
      t.text :text  #本来はcaptionにしたいところ。修正はどうすれば？？
      t.integer :user_id
      t.timestamps
    end
  end
end
