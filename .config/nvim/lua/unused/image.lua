return {
    '3rd/image.nvim',
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    config = function()
        require('image').setup {
            backend = 'kitty',
            kitty_method = 'normal',
            processor = 'magick_cli',
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = true,
                    download_remote_images = true,
                    only_render_image_at_cursor = false,
                    only_render_image_at_cursor_mode = 'inline',
                    floating_windows = false, -- if true, images will be rendered in floating markdown windows
                    filetypes = { 'markdown' }, -- markdown extensions (ie. quarto) can go here
                },
            },
            max_width = nil,
            max_height = nil,
            max_width_window_percentage = nil,
            max_height_window_percentage = 20,
            window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
            window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', 'snacks_notif', 'scrollview', 'scrollview_sign' },
            editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
            tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
            hijack_file_patterns = { '*.png', '*.jpg', '*.jpeg', '*.gif', '*.webp', '*.avif' }, -- render image files as images when opened
        }
    end,
}
