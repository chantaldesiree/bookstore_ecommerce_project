class AddReferenceToOrderBookInBook < ActiveRecord::Migration[6.0]
    def change
      add_reference :books, :orderbook, index: true, foreign_key: true
    end

end
