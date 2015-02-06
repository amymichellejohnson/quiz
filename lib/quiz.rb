class Quiz <ActiveRecord::Base
  has_many(:questions)
  validates(:name, {:presence => true, :uniqueness=> true} )
  before_save(:capitalize_name)


private
  def capitalize_name
    self.name=(name.titleize)
  end
end
