return {
	'rcarriga/nvim-notify',
	config = function()
		require('notify').setup({
			stages = 'static',
			icons = {
				ERROR = '',
				WARN = '',
				INFO = '',
				DEBUG = '',
				TRACE = '✎',
			},
		})
	end,
}
