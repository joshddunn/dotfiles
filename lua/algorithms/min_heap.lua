lib = require("../lib")

lib.class("MinHeap")

function MinHeap:init()
  self.array = {}
end

function MinHeap:left_child_index(index)
  return 2 * index
end

function MinHeap:right_child_index(index)
  return 2 * index + 1
end

function MinHeap:parent_index(index)
  return math.floor(index / 2)
end

function MinHeap:append(priority, value)
  lib.push(self.array, { priority, value or priority })

  local index = #self.array
  local parent_index = self:parent_index(index)

  while parent_index ~= 0 and self.array[index][1] < self.array[parent_index][1] do
    self.array[parent_index], self.array[index] = self.array[index], self.array[parent_index]

    index = parent_index
    parent_index = self:parent_index(index)
  end
end

function MinHeap:remove()
  self.array[#self.array], self.array[1] = self.array[1], self.array[#self.array]

  local value = lib.pop(self.array)

  if #self.array == 0 then
    return value
  end

  local focus = 1
  local index, left_child_index, right_child_index

  while focus ~= index do
    index = focus
    left_child_index = self:left_child_index(index)
    right_child_index = self:right_child_index(index)

    if self.array[left_child_index] and self.array[left_child_index][1] < self.array[focus][1] then
      focus = left_child_index
    end

    if self.array[right_child_index] and self.array[right_child_index][1] < self.array[focus][1] then
      focus = right_child_index
    end

    if focus ~= index then
      self.array[focus], self.array[index] = self.array[index], self.array[focus]
    end
  end

  return value
end
