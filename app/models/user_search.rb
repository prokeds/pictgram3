class UserSearch
  include ActiveModel::Model

  attr_accessor :search_name

  def execute
    User.ransack(name_eq: @search_name).result
  end
end
