module Form
  module Static
    extend ActiveSupport::Concern

    included do
      self.abstract_class = true
    end

    def send_email?
      false
    end

    def form_name
      model_name.element
    end
  end
end