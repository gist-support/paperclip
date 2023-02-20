module Paperclip
  class HttpUrlProxyAdapter < UriAdapter

    REGEXP = /\Ahttps?:\/\//

    def initialize(target)
      super(URI(CGI.escape(target)))
    end

  end
end

Paperclip.io_adapters.register Paperclip::HttpUrlProxyAdapter do |target|
  String === target && target =~ Paperclip::HttpUrlProxyAdapter::REGEXP
end
