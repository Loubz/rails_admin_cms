module Viewable
  class ImagePresenter < ViewablePresenter
    def path
      m.image
    end

    def url
      "#{h.request.base_url}#{path}" if path.present?
    end

    def html
      m.text.try(:html_safe)
    end

    def text
      h.strip_tags m.text
    end
  end
end
