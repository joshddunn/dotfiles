lib = require("lib")

require("algorithms/min_heap")

math.randomseed(os.time())

function random_array(n)
  local arr = {}
  for i = 1, n do
    lib.push(arr, math.random())
  end
  return arr
end

for i=0, 1000 do
  test = random_array(100)

  min_heap = MinHeap:new()

  lib.each(test, function(t)
    min_heap:append(t)
  end)

  comp = {}

  lib.each(test, function(t)
    lib.push(comp, min_heap:remove()[1])
  end)

  table.sort(test)

  same = true

  lib.each(test, function(t, i)
    if t ~= comp[i] then
      same = false
      print(tostring(t) .. " " .. tostring(comp[i]))
    end
  end)

  if not same then
    lib.each(test, function(t, i)
      test[i] = tostring(test[i])
      comp[i] = tostring(comp[i])
    end)

    print(table.concat(comp, " "))
    print(table.concat(test, " "))
  else
    io.write(".")
  end
end
