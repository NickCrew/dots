version = '0.21.3'

local home = os.getenv("HOME")

local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path
    .. ";"
    .. xpm_path
    .. "/?.lua;"
    .. xpm_path
    .. "/?/init.lua"

os.execute(
  string.format(
    "[ -e '%s' ] || git clone '%s' '%s'",
    xpm_path,
    xpm_url,
    xpm_path
  )
)


require("xpm").setup({
  plugins = {
    {
      name = 'dtomvan/xpm.xplr'
    },
    {
      name = 'sayanarijit/fzf.xplr'
    },
    {
      name = 'sayanarijit/registers.xplr'
    },
    -- {
    --   name = 'sayanarijit/term.xplr'
    -- },
    {
      name = 'sayanarijit/map.xplr'
    },
    {
      name = "sayanarijit/type-to-nav.xplr"
    },
    {
      name = "sayanarijit/tri-pane.xplr"
    },
    {
      name = 'sayanarijit/context-switch.xplr'
    },
    {
      name = 'sayanarijit/find.xplr'
    },
    {
      name = 'sayanarijit/nvim-ctrl.xplr'
    },
    {
      name = 'sayanarijit/zoxide.xplr'
    },
    -- { 
    --   name = 'hartan/web-devicons.xplr',
    -- },
    -- {
    --   name = 'dtomvan/extra-icons.xplr'
    -- }
  },
  auto_install = true,
  auto_cleanup = true,
})

-- require("web-devicons").setup()
-- require("extra-icons").setup()
require("map").setup()
require("type-to-nav").setup()
require("nvim-ctrl").setup()
require("zoxide").setup()
