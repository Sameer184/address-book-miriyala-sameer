class UpdateForeignKeyForPhoneNumbers < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :phone_numbers, :people
    add_foreign_key :phone_numbers, :people, on_delete: :cascade
  end
end
