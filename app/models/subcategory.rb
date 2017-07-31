class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :article_subcategories
  has_many :articles, through: :article_subcategories
end
