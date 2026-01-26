import globals from "globals";
import pluginJs from "@eslint/js";
import tseslint from "typescript-eslint";

/** @type {import('eslint').Linter.Config[]} */
export default [
	{
		files: ["**/*.{js,mjs,cjs,ts}"],
	},
	{
		languageOptions: {
			globals: globals.browser,
		},
	},
	pluginJs.configs.recommended,
	...tseslint.configs.recommended,
	// Add Prettier to the configuration
	{
		extends: [
			"eslint:recommended",
			"plugin:prettier/recommended", // Enables eslint-plugin-prettier and eslint-config-prettier
		],
		plugins: ["prettier"], // Include the Prettier plugin
		rules: {
			"prettier/prettier": "error", // Ensure Prettier issues are shown as errors
		},
	},
];
