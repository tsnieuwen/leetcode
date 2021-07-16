def is_valid(stale, latest, otjson)
  stale_array = stale.chars
  action_index = 0
  otjson.each do |command|
    if command[:op] == "skip"
      action_index += (command[:count])
    elsif command[:op] == "delete"
      command[:count].times do
        stale_array.delete_at(action_index)
      end
    elsif command[:op] == "insert"
      chars_array = command[:chars].chars
      stale_array.insert(action_index, chars_array)
      stale_array = stale_array.flatten
    end
  end
  stale_array.join == latest
end

original = "Hello World"
outcome = "Hello Tommy"
otjson = [{op: 'skip', count: 5}, {op: 'delete', count: 6}, {op: 'insert', chars: ' Tommy'}]
puts is_valid(original, outcome, otjson)
