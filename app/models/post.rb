class Post < ActiveRecord::Base
 belongs_to  :user
  has_many  :comments
  validates :category, :inclusion => { :in => ["후기","Q&A","공지사항"], :message => "공지사항, 후기, Q&A 중 하나를 선택하셔야 합니다." }
  validates :title, :presence => { :message => "제목을 반드시 입력하셔야 합니다." }
end
