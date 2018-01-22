class AddInvoiceToMaintenance < ActiveRecord::Migration[5.1]
  def change
    add_column :maintenances, :invoice, :string
  end
end
