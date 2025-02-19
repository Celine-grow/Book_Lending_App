class Book < ApplicationRecord
    has_many :borrowing_histories, dependent: :destroy

    validates :title, :author, :status, :description, presence: true
    validates :status, inclusion: { in: ["available", "borrowed"] }
  
    
    def available?
      status == "available"
    end
end
