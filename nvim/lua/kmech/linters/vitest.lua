local parser = require("lint.parser")

return {
  cmd = "npx",  -- or "pnpm" / "yarn" depending on your project
  stdin = false,
  args = {
    "vitest", "run", "--reporter=verbose"
  },
  stream = "stderr",
  ignore_exitcode = true,
  parser = parser.from_pattern(
    [[(%d+)%:%d+ %- (failed)%: (.+)]],
    { "lnum", "severity", "message" },
    {
      lnum = function(lnum) return tonumber(lnum) end,
      severity = parser.severity.ERROR,
    }
  ),
}
