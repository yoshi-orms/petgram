# テーブル設計

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| username           | string | null: false                   |
| email              | string | null: false, unique: true     |
| encrypted_password | string | null: false                   |
| profile            | text   | null: false                   |
| profile_image_id   | string | null: false                   |

### Association

- has_many :pets

## pets テーブル

| Column          | Type        |Options                        |
| --------------- | ------------ ------------------------------ |
| title           | string      | null: false                   |
| body            | text        | null: false                   |
| user            | references  | null: false, foreign_key:true |

### Association

- belongs_to :user
