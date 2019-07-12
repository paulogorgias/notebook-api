class AddKindToContact < ActiveRecord::Migration[5.2]
  def change
    add_reference :contacts, :kind, index: true
  end
end
