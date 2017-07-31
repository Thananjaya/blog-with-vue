class Article < ApplicationRecord
  has_many :article_subcategories
  has_many :subcategories, through: :article_subcategories
end
