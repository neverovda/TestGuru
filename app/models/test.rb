class Test < ApplicationRecord
  def self.tests_name_by(category)
    record_ctgr = Category.where(title: category)
    return unless record_ctgr
    tests = where(category_id: record_ctgr.ids.first).order(title: :desc)
    return if tests.empty?
    tests.map(&:title)
  end
end
