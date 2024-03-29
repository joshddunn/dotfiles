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

lib.each_with_index = function(arr, fn)
  for i, v in ipairs(arr) do
    fn(v, i)
  end
end

lib.any = function(arr, fn)
  for i, v in ipairs(arr) do
    if fn(v, i) then
      return true
    end
  end
  return false
end

lib.push = function(arr, v)
  table.insert(arr, v)
end

lib.pop = function(arr)
  return table.remove(arr)
end

lib.unshift = function(arr, v)
  table.insert(arr, 1, v)
end

lib.shift = function(arr)
  return table.remove(arr, 1)
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

lib.clone = function(arr)
  return lib.map(arr, function(v)
    return v
  end)
end

lib.clamp = function(val, min, max)
  if val < min then
    return min
  elseif val > max then
    return max
  else
    return val
  end
end

lib.last = function(arr)
  return arr[#arr]
end

lib.tosnake = function(str)
  return str:gsub("%u", function(s)
    return "_" .. s:lower()
  end):gsub("^_", "")
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

lib.join = function(t, delimiter)
  return table.concat(t, delimiter)
end

lib.class = function(name, parent)
  if parent and not _G[parent] then
    require(table.concat({ "models", tostring(tosnake(parent)) }, "."))
  end

  _G[name] = {}
  _G[name].__index = _G[name]
  _G[name]._type = name
  _G[name]._parent = parent

  _G[name].init_func = function(self, name, callbacks, ...)
    local parent = _G[name]._parent
    local varargs = ...
    if parent then
      lib.push(callbacks, _G[parent].init)
      _G[parent].init_func(self, parent, callbacks, varargs)
    else
      lib.reverse_each(callbacks, function(callback)
        callback(self, varargs)
      end)
      self:init(varargs)
    end
  end

  _G[name].new = function(self, ...)
    local self = {}
    setmetatable(self, _G[name])

    self._type = name
    self._parent = parent
    self:init_func(name, {}, ...)

    return self
  end

  if parent then
    setmetatable(_G[name], { __index = _G[parent] })
  end
end

lib.read_file = function(path)
  local file = io.open(path, "r")
  if not file then
    return nil
  else
    local body = file:read("*all")
    file:close()
    return body
  end
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
