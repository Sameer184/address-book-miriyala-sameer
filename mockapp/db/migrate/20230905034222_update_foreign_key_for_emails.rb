class UpdateForeignKeyForEmails < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :emails, :people
    add_foreign_key :emails, :people, on_delete: :cascade
  end
end
