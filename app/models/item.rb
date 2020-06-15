class Item < ApplicationRecord
    belongs_to :users, optional: true

end
