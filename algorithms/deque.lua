lib = require("../nvim/lua/lib")

lib.class("Deque")

function Deque:init()
  self.array = {}
end

function Deque:add_front(value)
  table.insert(self.array, 1, value)
end

function Deque:add_rear(value)
  table.insert(self.array, value)
end

function Deque:remove_front(value)
  return table.remove(self.array, 1)
end

function Deque:remove_rear(value)
  return table.remove(self.array)
end

function Deque:is_empty()
  return self:size() == 0
end

function Deque:size()
  return #self.array
end
