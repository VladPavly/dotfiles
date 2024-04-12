return {
	'xeluxee/competitest.nvim',
	dependencies = 'MunifTanjim/nui.nvim',
	config = function() require('competitest').setup({
        compile_command = {
		    cpp = { exec = "clang++", args = { "--debug", "$(FNAME)", "-std=c++11", "--output", "$(FNOEXT).out" } },
	    },
        run_command = {
		    cpp = { exec = "./$(FNOEXT).out", },
        },
        testcases_directory = "tests",
	    testcases_input_file_format = "$(FNOEXT)_input_$(TCNUM).txt",
	    testcases_output_file_format = "$(FNOEXT)_output_$(TCNUM).txt",
    }) end,
}

