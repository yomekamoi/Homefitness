module SearchTraining
  extend ActiveSupport::Concern
  included do
    scope :search_content, lambda { |keyword|
      table = Training.arel_table
      condition = table[:content].matches("%#{keyword}%")
      where(condition)
    }

    scope :search_category, lambda { |category_id|
      table = Category.arel_table
      condition = table[:id].eq(category_id)
      where(condition)
    }

    scope :search, lambda { |s|
      r = self
      r = r.search_content(s[:s_content]) if s[:s_content].present?
      r = r.joins(:categories).search_category(s[:s_category]) if s[:s_category].present?
      return r if r != self
      where({})
    }
  end
end