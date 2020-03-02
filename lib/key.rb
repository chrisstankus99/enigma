class Key
  attr_reader :keys

  def initialize(keys = number_generator)
    @keys = keys
  end

  def number_generator
    rand(1..99999).to_s.rjust(5, "0")
  end

  def key_set
    key_set_hash = {}
    key_set_hash["A"] = @keys.scan(/\d/).join('')[0, 2].to_i
    key_set_hash["B"] = @keys.scan(/\d/).join('')[1, 2].to_i
    key_set_hash["C"] = @keys.scan(/\d/).join('')[2, 2].to_i
    key_set_hash["D"] = @keys.scan(/\d/).join('')[3, 3].to_i
    key_set_hash
  end
end
