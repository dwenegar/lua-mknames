local M = {}

local files = {
  adjectives = 'data/adjectives.dat',
  nouns = 'data/nouns.dat'
}

local function load(what)
  local h = io.open(files[what], 'r')
  local words = {}
  for w in h:lines() do
    words[#words + 1] = w:match('^%s*(.-)%s*$')
  end
  return words
end

setmetatable(M, {
  __index = function(self, name)
    self[name] = load(name)
    return self[name]
  end
})

return M
