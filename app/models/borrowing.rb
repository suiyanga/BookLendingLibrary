class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # Validation: Borrowing must always have a due_date
  validates :due_date, presence: true

  # Scope to check active borrowings (not yet returned)
  scope :active, -> { where(returned_at: nil) }
end
