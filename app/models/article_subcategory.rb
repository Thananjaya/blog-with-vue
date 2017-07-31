class ArticleSubcategory < ApplicationRecord
  belongs_to :article
  belongs_to :subcategory, optional: true
end
