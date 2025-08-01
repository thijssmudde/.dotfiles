local M = {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  build = "./install --bin",
}

function M.config()
  local status, fzf = pcall(require, "fzf-lua")
  if not status then
    return
  end

  fzf.setup({
    -- Ensure fzf binary is found
    fzf_bin = "fzf",
    -- Global resume settings
    global_resume = true,
    global_resume_query = true,
    
    winopts = {
      height = 0.85,
      width = 0.80,
      row = 0.35,
      col = 0.50,
      border = "rounded",
      preview = {
        default = "bat",
        border = "border",
        wrap = "nowrap",
        hidden = "nohidden",
        vertical = "down:45%",
        horizontal = "right:50%",
        layout = "flex",
        flip_columns = 120,
        title = true,
        scrollbar = "float",
        delay = 100,
      },
    },
    
    previewers = {
      grep = {
        cmd = "bat",
        args = "--style=numbers,changes --color=always --highlight-line {2} --line-range {2}:+500",
      },
    },
    
    keymap = {
      builtin = {
        ["<C-d>"] = "preview-page-down",
        ["<C-u>"] = "preview-page-up",
      },
      fzf = {
        ["ctrl-q"] = "select-all+accept",
        ["ctrl-u"] = "unix-line-discard",
        ["ctrl-a"] = "beginning-of-line",
        ["ctrl-e"] = "end-of-line",
        ["alt-a"] = "toggle-all",
      },
    },
    
    -- Provider specific configs
    files = {
      prompt = "Files❯ ",
      multiprocess = true,
      git_icons = true,
      file_icons = true,
      color_icons = true,
      find_opts = [[-type f -not -path '*/\.git/*' -not -path '*/node_modules/*' -not -path '*/build/*' -not -path '*/dist/*']],
      fd_opts = [[--color=never --type f --hidden --follow --exclude .git --exclude node_modules --exclude build --exclude dist]],
    },
    
    grep = {
      prompt = "Rg❯ ",
      input_prompt = "Grep For❯ ",
      multiprocess = true,
      git_icons = true,
      file_icons = true,
      color_icons = true,
      -- Changed: removed --files-with-matches and added --color=always for highlighting
      rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512 --hidden --glob '!.git' --glob '!node_modules' --glob '!build' --glob '!dist'",
    },
    
    buffers = {
      prompt = "Buffers❯ ",
      file_icons = true,
      color_icons = true,
      sort_lastused = true,
    },
    
    git = {
      files = {
        prompt = "Git Files❯ ",
      },
      status = {
        prompt = "Git Status❯ ",
        preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
      },
      commits = {
        prompt = "Git Commits❯ ",
        preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
      },
      branches = {
        prompt = "Git Branches❯ ",
      },
    },
    
    lsp = {
      prompt_postfix = "❯ ",
      cwd_only = false,
      async_or_timeout = 5000,
      file_icons = true,
      color_icons = true,
    },
  })
end

return M