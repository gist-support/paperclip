require 'addressable/uri'

module Paperclip
  class HttpUrlProxyAdapter < UriAdapter

    REGEXP = /\Ahttps?:\/\//

    def initialize(target)
      super(Addressable::URI.parse(target).to_s)
    end

  end
end

Paperclip.io_adapters.register Paperclip::HttpUrlProxyAdapter do |target|
  String === target && target =~ Paperclip::HttpUrlProxyAdapter::REGEXP
end
