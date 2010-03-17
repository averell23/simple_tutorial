class Car < ActiveRecord::Base
  validates_presence_of :model_name, :made_in
  belongs_to :user
end
