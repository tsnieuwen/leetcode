def is_valid(stale, latest, otjson)
  stale_array = stale.chars
  action_index = 0
  json = parse_json(otjson)
  json.each do |command|
    if !command[:op]
      break
    elsif command[:op] == "skip"
      action_index += (command[:count])
    elsif command[:op] == "delete"
      command[:count].times do
        stale_array.delete_at(action_index)
      end
      action_index = stale_array.count
    elsif command[:op] == "insert"
      chars_array = command[:chars].chars
      stale_array.insert(action_index, chars_array)
      stale_array = stale_array.flatten
      action_index = stale_array.count
    end
    require "pry"; binding.pry
  end
  stale_array.join == latest
end

def parse_json(json_string)
  array = []
  hash = Hash.new


  array << hash
  hash = Hash.new

end

original = "Hello World"
outcome = "Hello Tommy Nieuwenhuis"
otjson = [{op: 'skip', count: 5}, {op: 'delete', count: 6}, {op: 'insert', chars: ' Tommy'}, {op: 'insert', chars: ' Nieuwenhuis'}]
puts is_valid(original, outcome, otjson)
