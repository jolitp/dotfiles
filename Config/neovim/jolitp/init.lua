require("import").config({
  output_split_type='vertical',
  import_enable_better_printing=true
})

require'plugins'

require'user.autocommands'
require'user.keymaps'
require'user.options'

-- need to put it here instead of in "setup" function
import"plugins.bufferline"
