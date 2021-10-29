lib = require("../lib")

lib.class("MinHeap")

function MinHeap:init()
  self.array = {}
end

function MinHeap:left_child_index(index)
  return 2 * (index - 1) + 1
end

function MinHeap:right_child_index(index)
  return 2 * (index - 1) + 1 + 1
end

function MinHeap:parent_index(index)
  return math.floor((index - 1) / 2) + 1
end

function MinHeap:append(priority, value)
  table.insert(self.array, { priority, value or priority })

  local index = #self.array
  local parent_index = self:parent_index(index)

  while self.array[index][1] < self.array[parent_index][1] do
    self.array[parent_index], self.array[index] = self.array[index], self.array[parent_index]

    index = parent_index
    parent_index = self:parent_index(index)
  end
end

function MinHeap:remove()
  local value = table.remove(self.array, 1)

  if #self.array == 0 then
    return value
  end

  table.insert(self.array, 1, table.remove(self.array, #self.array))

  local continue = true

  local index = 1
  local focus = 1
  local left_child_index = self:left_child_index(index)
  local right_child_index = self:right_child_index(index)

  while continue do
    if self.array[left_child_index] and self.array[left_child_index][1] < self.array[index][1] and self.array[left_child_index][1] >= self.array[right_child_index][1] then
      focus = left_child_index
    elseif self.array[right_child_index] and self.array[right_child_index][1] < self.array[index][1] then
      focus = right_child_index
    else
      continue = false
    end

    if continue then
      self.array[focus], self.array[index] = self.array[index], self.array[focus]
      index = focus
      left_child_index = self:left_child_index(index)
      right_child_index = self:right_child_index(index)
    end
  end

  return value
end
