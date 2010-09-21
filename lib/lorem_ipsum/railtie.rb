require 'lorem_ipsum'
require 'rails'

module LoremIpsum
  class Railtie < Rails::Railtie
    initializer 'lorem_ipsum.insert' do
      ActionView::Base.send(:include, LoremIpsum::Base)
    end
  end
end