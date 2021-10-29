lib = require("../lib")

lib.class("Set")

function Set:init()
  self.array = {}
end

function Set:add(value)
  self.array[value] = true
end

function Set:remove(value)
  self.array[value] = nil
end

function Set:includes(value)
  return self.array[value]
end
