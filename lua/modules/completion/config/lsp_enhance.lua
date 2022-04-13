local M = {}

local _json_schemas = {
	{
		description = "TypeScript compiler configuration file",
		fileMatch = {
			"tsconfig.json",
			"tsconfig.*.json",
		},
		url = "https://json.schemastore.org/tsconfig.json",
	},
	{
		description = "Lerna config",
		fileMatch = { "lerna.json" },
		url = "https://json.schemastore.org/lerna.json",
	},
	{
		description = "Babel configuration",
		fileMatch = {
			".babelrc.json",
			".babelrc",
			"babel.config.json",
		},
		url = "https://json.schemastore.org/babelrc.json",
	},
	{
		description = "ESLint config",
		fileMatch = {
			".eslintrc.json",
			".eslintrc",
		},
		url = "https://json.schemastore.org/eslintrc.json",
	},
	{
		description = "Bucklescript config",
		fileMatch = { "bsconfig.json" },
		url = "https://raw.githubusercontent.com/rescript-lang/rescript-compiler/8.2.0/docs/docson/build-schema.json",
	},
	{
		description = "Prettier config",
		fileMatch = {
			".prettierrc",
			".prettierrc.json",
			"prettier.config.json",
		},
		url = "https://json.schemastore.org/prettierrc",
	},
	{
		description = "Vercel Now config",
		fileMatch = { "now.json" },
		url = "https://json.schemastore.org/now",
	},
	{
		description = "Stylelint config",
		fileMatch = {
			".stylelintrc",
			".stylelintrc.json",
			"stylelint.config.json",
		},
		url = "https://json.schemastore.org/stylelintrc",
	},
	{
		description = "A JSON schema for the ASP.NET LaunchSettings.json files",
		fileMatch = { "launchsettings.json" },
		url = "https://json.schemastore.org/launchsettings.json",
	},
	{
		description = "Schema for CMake Presets",
		fileMatch = {
			"CMakePresets.json",
			"CMakeUserPresets.json",
		},
		url = "https://raw.githubusercontent.com/Kitware/CMake/master/Help/manual/presets/schema.json",
	},
	{
		description = "Configuration file as an alternative for configuring your repository in the settings page.",
		fileMatch = {
			".codeclimate.json",
		},
		url = "https://json.schemastore.org/codeclimate.json",
	},
	{
		description = "LLVM compilation database",
		fileMatch = {
			"compile_commands.json",
		},
		url = "https://json.schemastore.org/compile-commands.json",
	},
	{
		description = "Config file for Command Task Runner",
		fileMatch = {
			"commands.json",
		},
		url = "https://json.schemastore.org/commands.json",
	},
	{
		description = "AWS CloudFormation provides a common language for you to describe and provision all the infrastructure resources in your cloud environment.",
		fileMatch = {
			"*.cf.json",
			"cloudformation.json",
		},
		url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/cloudformation.schema.json",
	},
	{
		description = "The AWS Serverless Application Model (AWS SAM, previously known as Project Flourish) extends AWS CloudFormation to provide a simplified way of defining the Amazon API Gateway APIs, AWS Lambda functions, and Amazon DynamoDB tables needed by your serverless application.",
		fileMatch = {
			"serverless.template",
			"*.sam.json",
			"sam.json",
		},
		url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/sam.schema.json",
	},
	{
		description = "Json schema for properties json file for a GitHub Workflow template",
		fileMatch = {
			".github/workflow-templates/**.properties.json",
		},
		url = "https://json.schemastore.org/github-workflow-template-properties.json",
	},
	{
		description = "golangci-lint configuration file",
		fileMatch = {
			".golangci.toml",
			".golangci.json",
		},
		url = "https://json.schemastore.org/golangci-lint.json",
	},
	{
		description = "JSON schema for the JSON Feed format",
		fileMatch = {
			"feed.json",
		},
		url = "https://json.schemastore.org/feed.json",
		versions = {
			["1"] = "https://json.schemastore.org/feed-1.json",
			["1.1"] = "https://json.schemastore.org/feed.json",
		},
	},
	{
		description = "Packer template JSON configuration",
		fileMatch = {
			"packer.json",
		},
		url = "https://json.schemastore.org/packer.json",
	},
	{
		description = "NPM configuration file",
		fileMatch = {
			"package.json",
		},
		url = "https://json.schemastore.org/package.json",
	},
	{
		description = "JSON schema for Visual Studio component configuration files",
		fileMatch = {
			"*.vsconfig",
		},
		url = "https://json.schemastore.org/vsconfig.json",
	},
	{
		description = "Resume json",
		fileMatch = { "resume.json" },
		url = "https://raw.githubusercontent.com/jsonresume/resume-schema/v1.0.0/schema.json",
	},
}

M["sumneko_lua"] = function(opts)
	local runtime_path = vim.split(package.path, ";")
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")
	opts.settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	}
end

M["clangd"] = function(opts)
	opts.args = {
		"--background-index",
		-- "-std=c++20",
		"--pch-storage=memory",
		"--clang-tidy",
		"--suggest-missing-includes",
	}
	opts.capabilities.offsetEncoding = { "utf-16" }
	opts.single_file_support = true
	-- Disable `clangd`'s format
	-- opts.on_attach = function(client, buffnr)
	-- client.resolved_capabilities.document_formatting = false
	-- custom_attach(client, buffnr)
	-- end
end
M["jsonls"] = function(opts)
	opts.settings = {
		json = {
			-- Schemas https://www.schemastore.org
			schemas = _json_schemas,
		},
	}
end
M["tsserver"] = function(opts)
	-- Disable `tsserver`'s format
	-- opts.on_attach = function(client, buffnr)
	-- client.resolved_capabilities.document_formatting = false
	-- custom_attach(client, buffnr)
	-- end
end
M["dockerls"] = function(opts)
	-- Disable `dockerls`'s format
	-- opts.on_attach = function(client, buffnr)
	-- client.resolved_capabilities.document_formatting = false
	-- custom_attach(client, buffnr)
	-- end
end

M["gopls"] = function(opts)
	opts.settings = {
		gopls = {
			usePlaceholders = true,
			analyses = {
				nilness = true,
				shadow = true,
				unusedparams = true,
				unusewrites = true,
			},
		},
	}
	-- Disable `gopls`'s format
	-- opts.on_attach = function(client, buffnr)
	-- client.resolved_capabilities.document_formatting = false
	-- custom_attach(client, buffnr)
	-- end
end

return M
