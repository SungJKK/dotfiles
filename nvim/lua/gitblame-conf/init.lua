
vim.cmd('highlight default link gitblame SpecialComment')

vim.g.gitblame_enabled = 0
vim.g.gitblame_message_template = '       © <committer>, <date> • (sha:<sha>) "<summary>" '
vim.g.gitblame_date_format = '%r'
