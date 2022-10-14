class Order < ApplicationRecord
    enum status: {pending: 0, initiated: 1, terminated: 3 }
end
