class CreateItemTables < ActiveRecord::Migration[5.2]
  def change
    # 商品カテゴリテーブル
    create_table :item_categories do |t|
    t.string :name, null: false
    t.integer :position, null: false

    t.timestamps
    end

    # 商品販売者テーブル
    create_table :item_sellers do |t|
    t.string :name, null: false

    t.timestamps
    end
    add_index :item_sellers, :name, unique: true

    # 商品テーブル
    create_table :items do |t|
    t.string :title, null: false
    t.string :description, null: false
    t.integer :price, null: false
    t.integer :stock, null: false
    t.references :item_category, foreign_key: true, null: false
    t.references :item_seller, foreign_key: true, null: false
    t.date :published_on, index: true
    t.date :discontinued_on, index: true

    t.timestamps
    end

    # 商品画像テーブル
    create_table :item_images do |t|
    t.references :item, foreign_key: true, null: false
    t.string :file, null: false

    t.timestamps
    end

    # 商品著者テーブル
    create_table :item_authors do |t|
    t.string :name, null: false

    t.timestamps
    end

    # 商品著者商品テーブル
    create_table :item_authors_items do |t|
    t.references :item_author, foreign_key: true, null: false
    t.references :item, foreign_key: true, null: false
    t.string :author_type, null: false

    t.timestamps
    end
    add_index :item_authors_items, [:item_author_id, :item_id]

    # 商品ISBNコードテーブル
    create_table :item_isbn_codes do |t|
      t.references :item, foreign_key: true, null: false
      t.string :isbn13, null: false
      t.timestamps
    end
    add_index :item_isbn_codes, :isbn13, unique: true
  end
end
