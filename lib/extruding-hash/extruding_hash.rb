# `extruding-hash` provdes a data structure, based on a Hash of Arrays,
# that provides a method or two to gather data together in what can be
# considered _bins_.  The Hash functionality provides these _bins_,
# while the data values themselves are contained in Arrays, providing
# the concept of _columns_.
#
# The `extruding-hash` object has methods where if an added _column_ (in
# the form of a Hash) has any _bins_ that the object does not already
# contain, the _bin_ will be added, populated with *nil* values for any
# _columns_ that had not had a value for that _bin_ - see README.md for
# more info.
#
# Author::    Andrew Burnheimer (mailto:aburnheimer@gmail.com)
# Copyright:: Copyright (c) 2012
# License::   Creative Commons 3.0 License.  Details can be found in the
#             file LICENSE.

class ExtrudingHash < Hash

  # Set this sub-class of hash to the passed hash.
  def set_from_hash( right )
    right.each { |k,v| self[k] = v }
    return self
  end

  # Add a column into the structure.  Respect any _bins_ already in the
  # structure, and add nil values to any existing columns that haven't
  # included the _bins_ of the newly passed-in column.
  def <<( right )
    return right
  end

  # The (largest) number of columns among all _bins_ of the Hash.
  def columns
    ret = -1
    self.each do |key, value|
      ret = value.count if value.count > ret
    end

    if ret < 0
      nil
    else
      ret
    end
  end

  # Grow any extent short rows to the same width as the longest
  def normalize!
    max = self.columns

    self.each do |key, value|
      value << nil while value.count < max
    end

    max
  end

end

# vim:set et ts=2 sts=2 sw=2 tw=72 wm=72 ai:
