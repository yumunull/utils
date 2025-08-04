return {
  "m-gail/diagnostic_manipulation.nvim",
  event = "VeryLazy",
  init = function()
    require("diagnostic_manipulation").setup {
      blacklist = {
        function(d) return tostring(d.code) == "CS0436" end,
      },
    }
  end,
}