class ApplicationRecord < ActiveRecord::Base
    resourcify
  primary_abstract_class
  #  after_create :assign_default_role

  # def assign_default_role
  #   self.add_role(:newuser) if self.roles.blank?
  # end
end
