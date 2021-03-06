module Naming
  module Viewable
    module Block
      class << self
        def restricted_names
          @_restricted_names ||= Naming::Viewable.names + begin
            CMS.constants.grep(/Helper$/).map{ |name|
              "CMS::#{name}".constantize.instance_methods.grep(/^cms_/)
            }.flatten.map{ |name|
              name.to_s.sub(/^cms_/, '')
            }
          end
        end

        def names
          @_names ||= begin
            names = CMS.html_names 'app/views/cms/blocks'
            names.each do |name|
              if name.in? restricted_names
                raise ArgumentError, "'cms/blocks/_#{name}.html' partial should be called otherwise, '#{name}' taken"
              end
            end
            names
          end
        end
      end
    end
  end
end
