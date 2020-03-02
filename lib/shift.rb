class Shift
  def find_shift
    @offset.date_sets.merge(@key.key_sets) do |set_letter, old_num, new_num|
      old_num += new_num
    end
  end
end
