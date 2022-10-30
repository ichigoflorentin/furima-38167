class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" } 
  
  validates :item, :explanation,:image, presence: true
  
  validates :price, inclusion: { in: 300..9999999, message: "is invalid" }

  validates_format_of :price, with: /\A[0-9]+\z/

  has_one_attached :image
  belongs_to :user

end
