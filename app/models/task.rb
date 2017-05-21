class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 250 }
  validates :status, presence: true, inclusion: { in: %w(未着手 完了) }
  validates :user_id, presence: true
  validates :task_date, presence: true
  belongs_to :user
end

