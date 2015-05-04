class AddHeadlineToCover < ActiveRecord::Migration
  def change
    add_column :covers, :headline, :string, after: :source
  end
end
