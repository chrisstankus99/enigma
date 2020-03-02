class Key
  attr_reader :keys

  def initialize(keys = number_generator)
    @keys = keys
  end

  def number_generator
    rand(1..99999).to_s.rjust(5, "0")
  end

  def key_sets
    key_sets_hash = {}
    key_sets_hash["A"] = @keys.scan(/\d/).join('')[0, 2].to_i
    key_sets_hash["B"] = @keys.scan(/\d/).join('')[1, 2].to_i
    key_sets_hash["C"] = @keys.scan(/\d/).join('')[2, 2].to_i
    key_sets_hash["D"] = @keys.scan(/\d/).join('')[3, 3].to_i
    key_sets_hash
  end
end
