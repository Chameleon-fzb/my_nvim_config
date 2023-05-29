return {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas({
				select = {
					".eslintrc",
					".eslintrc.json",
					"jsconfig.json",
					"tsconfig.json",
					"package.json",
					".prettierrc.json",
					".prettierrc",
					"prettier.config.json",
					"babelrc",
					"babelrc.json",
					"babelrc.config.json",
					".postcssrc",
					".pre-commit-config.yml",
					".pre-commit-hooks.yml",
					".stylelintrc",
					".stylelintrc.json",
					"stylelintrc.config.json",
					".vsconfig",
					".lintstagedrc",
					".commitlintrc",
					".yarnrc.yml",
				},
				validate = { enable = true },
			}),
		},
	},
}
