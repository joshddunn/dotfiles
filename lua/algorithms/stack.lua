lib = require("../nvim/lua/lib")

lib.class("Stack")

function Stack:init()
  self.array = {}
end

function Stack:push(value)
  table.insert(self.array, value)
end

function Stack:pop(value)
  return table.remove(self.array)
end

function Stack:peek(value)
  return self.array[self:size()]
end

function Stack:is_empty()
  return self:size() == 0
end

function Stack:size()
  return #self.array
end
