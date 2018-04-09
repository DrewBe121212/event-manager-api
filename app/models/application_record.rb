class ApplicationRecord < ActiveRecord::Base
  before_validation :clean_input

  self.abstract_class = true

  private

  def clean_input
    #this.attributes.each do |name, value|
    #  this[name] = value.strip unless value.empty?
    #end
  end

end
