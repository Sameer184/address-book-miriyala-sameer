  class UpdateForeignKeyForAddresses < ActiveRecord::Migration[7.0]
    def change
      remove_foreign_key :addresses, :people
      add_foreign_key :addresses, :people, on_delete: :cascade
    end
end
