class ApplicationRecord < ActiveRecord::Base
  before_validation :clean_input

  self.abstract_class = true

  protected

  def clean_input
    this.attributes.each do |name, value|
      if self[name].respond_to?(:strip)
        self[name] = value.strip unless value.empty?
      end
    end
  end

end
