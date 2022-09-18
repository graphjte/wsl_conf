local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix



ls.add_snippets("cpp", {

	s({
		trig = "AN",
		namr = "Template for CP",
		dscr = "Template for CP",
	}, {
		t({
			"#include <bits/stdc++.h>",
			"using namespace std;",
			"",
			"const int MAX = 2e5+6;",
			"const int MOD = 1e9+7;",
			"",
			"int main(int argc, char const *argv[])",
			"{",
			"    ios_base::sync_with_stdio(0);",
			"    cin.tie(0); cout.tie(0);",
			"",
			"\t",
		}),
		i(0),
		t({
			"",
			"    return 0;",
			"}",
		}),
	}),

	s({
		trig = "TestCase",
		namr = "Multi Test Case",
		dscr = "Multi test case.",
	}, {
		t({
			"int T;",
			"cin >> T;",
			"while (T--) {",
			"\t",
		}),
		i(0),
		t({
			"",
			"}",
		}),
	}),

	s({
		trig = "ii",
		namr = "pair<int, int>",
		dscr = "pair<int, int>",
	}, {
		t({"pair<int, int> "}),
	}),

	s({
		trig = "i64",
		namr = "snippet for int64_t",
		dscr = "snippet for int64_t",
	}, {
		t({"int64_t "}),
	}),

	s({
		trig = "vec",
		namr = "snippet for vector declaration",
		dscr = "snippet for vector declaration.",
	}, {
		t({"vector<"}),
		i(1,"int"),
		t({"> "}),
		i(0),
	}),

	s({
		trig = "fi",
		namr = "get the first element in a pair",
		dscr = "get the first element in a pair.",
	}, {
		i(1,"name"),
		t({".first"}),
		i(0),
	}),

	s({
		trig = "se",
		namr = "get the second element in a pair",
		dscr = "get the second element in a pair.",
	}, {
		i(1,"name"),
		t({".second"}),
		i(0),
	}),

	s({
		trig = "all",
		namr = "all",
		dscr = "ds_name.begin(), ds_name.end()",
	}, {
		i(1,"name"),
		t({".begin(), "}),
		rep(1),
		t({".end()"}),
		i(0),
	}),

	s({
		trig = "FOR",
		namr = "range-based for loop",
		dscr = "range-based for loop.",
	}, {
		t({"for(int "}),
		i(1,"i"),
		t({" = "}),
		i(2,"1"),
		t({"; "}),
		rep(1),
		t({" <= "}),
		i(3,"n"),
		t({"; "}),
		rep(1),
		t("++) "),
		i(0),
	}),

	s({
		trig = "FORD",
		namr = "reversed range-based for loop",
		dscr = "reversed range-based for loop.",
	}, {
		t({"for(int "}),
		i(1,"i"),
		t({" = "}),
		i(2,"n"),
		t({"; "}),
		rep(1),
		t({" >= "}),
		i(3,"1"),
		t({"; "}),
		rep(1),
		t("--) "),
		i(0),
	}),
})
