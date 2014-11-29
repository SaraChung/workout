class ModifyRatingColumn < ActiveRecord::Migration
  def up
    execute('ALTER TABLE "reviews" ALTER COLUMN "rating" TYPE float(2) USING (rating::float)')
  end

  def down
    change_column :reviews, :rating, :string
  end
end
