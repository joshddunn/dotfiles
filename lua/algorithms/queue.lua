lib = require("../lib")

lib.class("Queue")

function Queue:init()
  self.array = {}
end

function Queue:enqueue(value)
  table.insert(self.array, value)
end

function Queue:dequeue(value)
  return table.remove(self.array, 1)
end

function Queue:is_empty()
  return self:size() == 0
end

function Queue:size()
  return #self.array
end
