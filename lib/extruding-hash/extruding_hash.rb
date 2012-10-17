class ExtrudingHash < Hash

  def set_from_hash( right )
    right.each { |k,v| self[k] = v }
    return self
  end

  def <<( right )
    return right
  end

end

# vim:set et ts=2 sts=2 sw=2 tw=72 wm=72 ai:
