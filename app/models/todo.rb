class Todo < ActiveRecord::Base
  attr_accessible :title, :body, :list_name

  before_save :parameterize_listname

  def parameterize_listname
    self.list_name = self.list_name.downcase.gsub ' ', '-'
  end

  def count
    Todo.where(list_name: list_name).length
  end
end
