math.randomseed(os.time())

local data = require 'data'

local function random_select(list, min_length, max_length, start)
  local function check_requirements(w)
    if min_length and #w < min_length then
      return false
    end
    if max_length and #w > max_length then
      return false
    end
    if start and w:find(start, 1, true) ~= 1 then
      return false
    end
    return true
  end

  while true do
    local i = math.random(#list)
    local w = list[i]
    if check_requirements(w) then
      return w
    end
  end
end

local adj_min_length, adj_max_length, adj_start = 1, math.maxinteger
local noun_min_length, noun_max_length, noun_start = 1, math.maxinteger
local count = 10
local i = 1
while i < #arg do
  local a = arg[i]
  if a == '--adj_min' then
    adj_min_length = tonumber(arg[i + 1])
    i = i + 1
  elseif a == '--adj_max' then
    adj_max_length = tonumber(arg[i + 1])
    i = i + 1
  elseif a == '--adj_start' then
    adj_start = arg[i + 1]
    i = i + 1
  elseif a == '--noun_min' then
    noun_min_length = tonumber(arg[i + 1])
    i = i + 1
  elseif a == '--noun_max' then
    noun_max_length = tonumber(arg[i + 1])
    i = i + 1
  elseif a == '--noun_start' then
    noun_start = arg[i + 1]
    i = i + 1
  elseif a == '--count' then
    count = tonumber(arg[i + 1])
  end
  i = i + 1
end

local function log(name, value)
  if value then
    print(('%-15s %s'):format(name, value))
  end
end

print('======================================')
log('count', count)
log('adj_min_length', adj_min_length)
log('adj_max_length', adj_max_length)
log('adj_start',adj_start)
log('noun_min_length', noun_min_length)
log('noun_max_length', noun_max_length)
log('noun_start', noun_start)
print('======================================')

for i = 1, count do
  local a = random_select(data.adjectives, adj_min_length, adj_max_length, adj_start)
  local n = random_select(data.nouns, noun_min_length, noun_max_length, noun_start)
  print(('%4d %s %s'):format(i, a, n))
end
