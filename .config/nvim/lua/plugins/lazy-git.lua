return {
    'kdheepak/lazygit.nvim',
    cmd = {
        'LazyGit',
        'LazyGitConfig',
        'LazyGitCurrentFile',
        'LazyGitFilter',
        'LazyGitFilterCurentFile',
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
        { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open lazy git' },
    },
}
