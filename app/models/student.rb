class Student < ActiveRecord::Base
    self.foreign = :sid
    has_many :drop_in_histories
end
