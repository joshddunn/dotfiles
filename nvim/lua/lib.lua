local lib = {}

lib.each = function(arr, fn)
  for i, v in ipairs(arr) do
    fn(v, i)
  end
end

lib.reverse_each = function(arr, fn)
  local length = #arr
  for i = 1, length do
    fn(arr[length - i + 1], length - i + 1)
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

lib.split = function(string, delimiter)
  local arr = {}

  if string == "" then
    return arr
  end

  for match in (string..delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(arr, match)
  end

  return arr
end

lib.includes = function(str, pattern)
  return not not string.find(str, pattern)
end

lib.replace = function(str, pattern, replacement, opts)
  opts = opts or {}
  prefix = opts.prefix or ""
  suffix = opts.suffix or ""
  pattern = string.gsub(pattern, "[%(%)%[%]%.%+%-%*%?%$%%]", "%%%1")
  pattern = prefix .. pattern .. suffix
  replacement = string.gsub(replacement, "[%%]", "%%%%")
  return string.gsub(str, pattern, replacement)
end

return lib
