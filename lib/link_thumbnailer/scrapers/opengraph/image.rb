require 'link_thumbnailer/scrapers/opengraph/base'

module LinkThumbnailer
  module Scrapers
    module Opengraph
      class Image < ::LinkThumbnailer::Scrapers::Opengraph::Base

        private

        def value
          model
        end

        def model
          nodes.map { |n| modelize(n, n.attributes['content'].to_s) }
        end

        def modelize(node, text = nil)
          model_class.new(text)
        end

        def nodes
          nodes = meta_xpaths(attribute: attribute)
          nodes.empty? ? meta_xpaths(attribute: attribute, key: :name) : nodes
        end

      end
    end
  end
end