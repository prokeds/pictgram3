class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  #課題R05　名前の長さに制限を追加する
  #validates :name, length: { maximum: 15 }
  #課題R05　パスワードの文字数制限を追加する
  #validates :password, length: { in: 8..32 }
  #課題R05 パスワードをアルファベット、数字の混合のみ可能にしてください
  #validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  #課題R05　メールアドレスの正規表現を追加してください
  #validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_secure_password
  has_many :comments
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
