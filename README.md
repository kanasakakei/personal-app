# MR LIFE
 
__製薬会社の営業マンや医療従事者のための交流サービスです__

アプリURL
https://personal-app1.herokuapp.com/

※アプリTOPページのゲストログイン(閲覧用)よりご確認ください。

１　薬剤や製薬会社について気になる情報はSlackのようなメッセージのやりとりで気軽に情報交換できます。  
２　気になるトピックがあればブログのように記事を投稿でき、それに対してコメントもできます。

 

# Description
【投稿】
* Slackのようなメッセージ投稿/編集/削除機能
* 書き込みへの返信の投稿/編集/削除機能
* ジャンル別（業界・会社・地区など）投稿機能
* ブログのような記事投稿/編集/削除機能
* いいねの数に応じたランキング一覧表示
* 検索機能/ページネーション
* コメント機能  
 
【ユーザー】
* ユーザーの新規登録/編集/削除機能
* ゲストユーザーでのログイン機能
* お気に入り・いいねの表示
* ログイン/ログアウト機能
* マイページ表示・編集
* 投稿記事一覧表示
* Twitterと連動  
  
【その他】
* インフラ(heroku)
* 単体・統合テスト(RSpec, factory_bot, capybara)


# Requirement
__バックエンド__ 
* Ruby 2.6.3
* Ruby on Rails 6.0.3
* MySQL2 0.4.10

__フロントエンド__
* Haml
* Sass
* Bootstrap4
* Javascript
* Jquery
* Vue.js
* Ajax

# Theme 

現在、製薬会社の営業マンで日々活動中。
活動の中、他社営業マンの考えや薬剤の評価、業界の動向を知る機会が少ないと感じていました。   
気軽に共有できる場が欲しいと考え、また裏話や有意義な情報はブログ記事で共有できると面白いと思ったため今回のアプリ開発に着手。




# Usage
 医療業界、特に製薬業界に特化した交流会サイト。
様々なジャンルで気軽にメッセージのやりとりができます。一つのメッセージにはスレッド機能もあります。  
また、文章で伝えたいことがあればブログ形式で情報発信もでき、その記事に対する評価は「いいね」やコメントで行われます。  

お気に入り機能もあるので、あとで読みたい記事などは登録しておくと便利です。
問い合わせ機能もあるので、不満点や改善点があれば要望できます。

 
# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|email|string|null: false|
|encrypted_password"|string|null:false|
|reset_password_token|string|
|image|string|
|profile|text|

### Association
- has_many :messages
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes
- has_many :liked_posts, through: :likes, source: :post


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|
|post_id|bigint|
|user_id|bigint|


### Association
 - belongs_to :post
 - belongs_to :user


## contactsテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|
|message|text|

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

### Association
- has_many :messages



## likesテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|bigint|
|user_id|bigint|

### Association
- belongs_to :post
- belongs_to :user


## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|
|image|string|

### Association
- belongs_to :user, optional: true
- belongs_to :group, optional: true



## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|
|content|text|
|image|text|
|user_id|bigint|

### Association
- belongs_to :user, optional: true
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user

