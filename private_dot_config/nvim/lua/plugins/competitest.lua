return {
	'xeluxee/competitest.nvim',
	dependencies = 'MunifTanjim/nui.nvim',
	config = function() require('competitest').setup({
        compile_command = {
		    cpp = { exec = 'clang++', args = { '--debug', '$(FNAME)', '-std=c++20', '--output', '$(FNOEXT).out' } },
	    },
        run_command = {
		    cpp = { exec = './$(FNOEXT).out', },
        },

        testcases_directory = 'tests',
	    testcases_input_file_format = '$(FNOEXT)_input_$(TCNUM).txt',
	    testcases_output_file_format = '$(FNOEXT)_output_$(TCNUM).txt',

        received_contests_problems_path = '$(JAVA_TASK_CLASS).$(FEXT)',

        template_file = '~/Desktop/Main/Projects/codeforces/template.$(FEXT)',
        evaluate_template_modifiers = true,
        open_received_contests = false
    }) end,
    keys = {
        { '<leader>cr', '<cmd>CompetiTest run <CR>', desc = 'Run tests' },
        { '<leader>cl', '<cmd>CompetiTest receive contest <CR>', desc = 'Load contest' },
        { '<leader>ca', '<cmd>CompetiTest add_testcase <CR>', desc = 'Add testcase' },
        { '<leader>ce', '<cmd>CompetiTest edit_testcase <CR>', desc = 'Edit testcase' },
        { '<leader>cd', '<cmd>CompetiTest delete_testcase <CR>', desc = 'Delete testcase' }
    }
}
