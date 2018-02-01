class Atbash
  DEFAULT_CIPHER = 'oephjizkxdawubnytvfglqsrcm'
  CONSTANT       = 'abcdefghijklmnopqrstuvwxyz'

  attr_reader :secret
  attr_reader :cache, :inverted_cache # caching

  class InvalidCipherException < StandardError; end

  def initialize
    @secret  = ENV['CIPHER'] || DEFAULT_CIPHER

    validate!

    @cache   = secret.chars.inject({}) do |res, e|
      res[e] = CONSTANT[secret.index(e)]
      res
    end

    @inverted_cache = @cache.invert
  end

  def validate!
    if @secret.chars.sort != CONSTANT.chars.sort
      raise InvalidCipherException.new("Cipher mistmatch constant.")
    end
  end

  def encrypt(text:)
    return nil unless text

    text.chars.inject([]) do |res, e|
      res.push(inverted_cache[e] || e)
      res
    end.join
  end

  def decrypt(text:)
    return nil unless text

    text.chars.inject([]) do |res, e|
      res.push(cache[e] || e)
      res
    end.join
  end

end