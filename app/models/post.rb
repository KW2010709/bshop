class Post < ActiveRecord::Base
 belongs_to  :user
  has_many  :comments
  validates :category, :inclusion => { :in => ["소주","보드카","와인"], :message => "소주, 보드카, 와인 중 하나를 선택하셔야 합니다." }
  validates :title, :presence => { :message => "제목을 반드시 입력하셔야 합니다." }
end
