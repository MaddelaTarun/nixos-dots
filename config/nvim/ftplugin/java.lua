local jdtls = require("jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.expand("~/.cache/jdtls/workspace/") .. project_name

-- Get the mason path
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/jdtls")
local launcher_jar = vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config_path = mason_path .. "/config_linux"
local lombok_path = mason_path .. "/lombok.jar"

local extendedClientCapabilities = {}
if jdtls.make_client_capabilities then
	extendedClientCapabilities = jdtls.make_client_capabilities()
end
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. lombok_path,
		"-jar",
		launcher_jar,
		"-configuration",
		config_path,
		"-data",
		workspace_dir,
	},

	root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

	settings = {
		java = {
			signatureHelp = { enabled = true },
			extendedClientCapabilities = extendedClientCapabilities,
			maven = {
				downloadSources = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all", -- variants: "none", "literals", "all"
				},
			},
			format = {
				enabled = false,
			},
		},
	},

	init_options = {
		bundles = {
			vim.fn.glob(
				vim.fn.stdpath("data") .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
				true
			),
		},
		extendedClientCapabilities = extendedClientCapabilities,
	},
}

vim.list_extend(
	config.init_options.bundles,
	vim.split(vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/java-test/extension/server/*.jar", true), "\n")
)

config.on_attach = function(client, bufnr)
	jdtls.setup_dap({ hotcodereplace = "auto" })
	local opts = { buffer = bufnr, silent = true }
	vim.keymap.set("n", "<leader>oi", jdtls.organize_imports, { desc = "Organize Imports", buffer = bufnr })
	vim.keymap.set("n", "<leader>ev", jdtls.extract_variable, { desc = "Extract Variable", buffer = bufnr })
	vim.keymap.set("v", "<leader>ev", function()
		jdtls.extract_variable(true)
	end, { desc = "Extract Variable", buffer = bufnr })
	vim.keymap.set("n", "<leader>ec", jdtls.extract_constant, { desc = "Extract Constant", buffer = bufnr })
	vim.keymap.set("v", "<leader>ec", function()
		jdtls.extract_constant(true)
	end, { desc = "Extract Constant", buffer = bufnr })
	vim.keymap.set("v", "<leader>em", function()
		jdtls.extract_method(true)
	end, { desc = "Extract Method", buffer = bufnr })
end

jdtls.start_or_attach(config)
