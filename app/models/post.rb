class Post < ApplicationRecord
    validates :title, presence: true, length: { maximum: 50 }, on:[:create, :update]
    validates :begin_day, presence: true, on: :create
    validates :finish_day, presence: true, on: :create
    validate :date_before_start, on: :create
  def date_before_start
    if begin_day.present? && begin_day < Date.today
    errors.add(:begin_day, "は今日以降のものを選択してください") 
    end
  end
    validate :begin_day__after__finish_day, on: :create
  def begin_day__after__finish_day
    errors.add(:begin_day, "終了日は開始日以降のものを選択してください") unless begin_day.to_s < finish_day.to_s
  end
end
