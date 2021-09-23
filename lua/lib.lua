local lib = {}

lib.each = function(arr, fn)
  for i, v in ipairs(arr) do
    fn(v, i)
  end
end

lib.push = function(arr, v)
  table.insert(arr, v)
end

lib.map = function(arr, fn)
  local map = {}
  lib.each(arr, function(v, i)
    lib.push(map, fn(v, i))
  end)
  return map
end

lib.filter = function(arr, fn)
  local filter = {}
  lib.each(arr, function(v, i)
    if fn(v, i) then
      lib.push(filter, v)
    end
  end)
  return filter
end

return lib
