class CreateServiceCategoriesServices < ActiveRecord::Migration[7.0]
  def change
    create_table :service_categories_services, id: false do |t|
      t.references :service_category, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
    end
  end
end
