require 'hashie/hash'
require 'hashie/mash'

module Pokemon
  class HashieSnake < Hashie::Mash
    protected
    
    def convert_key(key)
      underscore_string(key.to_s)
    end

    # converts a camel_cased string to a underscore string
    # subs spaces with underscores, strips whitespace
    # Same way ActiveSupport does string.underscore
    def underscore_string(str)
      str.to_s.strip.
        gsub(' ', '_').
        gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        squeeze("_").
        downcase
    end
  end
end