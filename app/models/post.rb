class Post < ActiveRecord::Base
 belongs_to  :user
  has_many  :comments
<<<<<<< HEAD
  validates :category, :inclusion => { :in => ["후기","Q&A","공지사항"], :message => "공지사항, 후기, Q&A 중 하나를 선택하셔야 합니다." }
=======
  validates :category, :inclusion => { :in => ["후기","Q&A","공지사항"], :message => "후기, Q&A, 공지사항 중 하나를 선택하셔야 합니다." }
>>>>>>> 435287e8d3db3ae8d74ba121aab70fc2a31a267e
  validates :title, :presence => { :message => "제목을 반드시 입력하셔야 합니다." }
end
