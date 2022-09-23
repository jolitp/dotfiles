--[[
     /  /\         /__/\         /  /\         /  /\          ___        ___          /__/\
    /  /:/         \  \:\       /  /:/_       /  /::\        /__/\      /  /\        |  |::\
   /  /:/           \__\:\     /  /:/ /\     /  /:/\:\       \  \:\    /  /:/        |  |:|:\
  /  /:/  ___   ___ /  /::\   /  /:/ /:/_   /  /:/  \:\       \  \:\  /__/::\      __|__|:|\:\
 /__/:/  /  /\ /__/\  /:/\:\ /__/:/ /:/ /\ /__/:/ \__\:\  ___  \__\:\ \__\/\:\__  /__/::::| \:\
 \  \:\ /  /:/ \  \:\/:/__\/ \  \:\/:/ /:/ \  \:\ /  /:/ /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/
  \  \:\  /:/   \  \::/       \  \::/ /:/   \  \:\  /:/  \  \:\|  |:|     \__\::/  \  \:\
   \  \:\/:/     \  \:\        \  \:\/:/     \  \:\/:/    \  \:\__|:|     /__/:/    \  \:\
    \  \::/       \  \:\        \  \::/       \  \::/      \__\::::/      \__\/      \  \:\
     \__\/         \__\/         \__\/         \__\/           ~~~~                   \__\/

	A config switcher written in Lua by NTBBloodbath and Vhyrro.
--]]

-- Defines the profiles you want to use
local profiles = {
	--[[
	Here's an example:

		<name_of_config> = { <path_to_config>, {
				plugins = "packer", -- Where to install plugins under site/pack
				preconfigure = "packer:opt" -- Whether or not to preconfigure a plugin manager for you
			}
		}

	More in-depth information can be found in cheovim's README on GitHub.
	--]]
	cris_at_machine_neovim_from_scratch = {
		"~/Config/neovim/_tutorials/chris-at-machine-nvim-from-scratch", {
			plugins = "packer",
			preconfigure = "packer",
		}

	},
	Neil_Sabde_Neovim_Lua_From_Scratch = {
		"~/Config/neovim/_tutorials/Neil_Sabde_Neovim_Lua_From_Scratch", {
			plugins = "packer",
			preconfigure = "packer",
		}
	},
	Tuff_Gniuz_Neovim_Lua_Config = {
		"~/Config/neovim/_tutorials/Tuff_Gniuz_Neovim_Lua_Config", {
			plugins = "packer",
			preconfigure = "packer",
		}
	},
	jolitp = {
		"~/Config/neovim/jolitp", {
			plugins = "packer",
			preconfigure = "packer",
		}
	},
	dist_doom = {
		"~/Config/neovim/_distributions_/doom-nvim", {
			plugins = "packer",
			preconfigure = "packer",
		}
	},
	dist_doom_stock = {
		"~/Config/neovim/_distributions_/doom-nvim_stock", {
			plugins = "packer",
			preconfigure = "packer",
		}
	},
}

-- return <name_of_config>, <list_of_profiles>
return "dist_doom", profiles
