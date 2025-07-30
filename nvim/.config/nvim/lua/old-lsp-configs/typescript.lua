-- import typescript plugin safely
local setup, typescript = pcall(require, "typescript")
if not setup then
  return
end

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }

  vim.lsp.buf.execute_command(params)
end

local function sort_imports()
  -- Get buffer content
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local import_lines = {}
  local import_indices = {}
  local pre_import_lines = {}
  local post_import_lines = {}
  local in_import_block = false
  local start_import_block = nil
  local last_import_index = 0
  local first_import_index = nil

  -- First, find the first import
  for i, line in ipairs(lines) do
    if line:match("^%s*import%s+.+%s+from%s+['\"].-['\"]") then
      first_import_index = i
      break
    end
  end

  -- Collect lines before first import, imports, and other lines
  for i, line in ipairs(lines) do
    if first_import_index and i < first_import_index then
      table.insert(pre_import_lines, line)
    elseif line:match("^%s*import%s+.+%s+from%s+['\"].-['\"]") then
      if not in_import_block then
        in_import_block = true
        start_import_block = i
      end
      table.insert(import_lines, line)
      table.insert(import_indices, i)
      last_import_index = i
    else
      if in_import_block and line:match("^%s*$") then
        in_import_block = false
      else
        if i <= #lines then
          if not first_import_index or i < first_import_index then
            table.insert(pre_import_lines, line)
          else
            table.insert(post_import_lines, line)
          end
        end
      end
    end
  end

  -- Separate imports into absolute and relative
  local absolute_imports = {}
  local relative_imports = {}
  
  for i, line in ipairs(import_lines) do
    if not line:match("^%s*$") then
      if line:match("from%s+['\"]%.") then
        table.insert(relative_imports, { index = i, line = line })
      else
        table.insert(absolute_imports, { index = i, line = line })
      end
    end
  end

  -- Helper function to detect if an import has a default import
  local function has_default_import(line)
    -- Match any import that has a name before a comma or before 'from'
    return line:match("^%s*import%s+[^{%s][^,]*%s+from")
  end

  -- Helper function to detect if an import is a type import
  local function is_type_import(line)
    return line:match("^%s*import%s+type")
  end

  -- Helper function to detect if an import is from react
  local function is_react_import(line)
    return line:match("from%s+['\"]react['\"]")
  end

  -- Sort absolute imports
  table.sort(absolute_imports, function(a, b)
    local a_is_react = is_react_import(a.line)
    local b_is_react = is_react_import(b.line)
    local a_has_default = has_default_import(a.line)
    local b_has_default = has_default_import(b.line)
    local a_is_type = is_type_import(a.line)
    local b_is_type = is_type_import(b.line)
    
    -- React imports come first
    if a_is_react and not b_is_react then
      return true
    elseif not a_is_react and b_is_react then
      return false
    end
    
    -- Types should come after non-types
    if a_is_type and not b_is_type then
      return false
    elseif not a_is_type and b_is_type then
      return true
    end
    
    -- Default imports come first
    if a_has_default and not b_has_default then
      return true
    elseif not a_has_default and b_has_default then
      return false
    end
    
    -- Alphabetical sort
    return a.line < b.line
  end)

  -- Sort relative imports
  table.sort(relative_imports, function(a, b)
    local a_has_default = has_default_import(a.line)
    local b_has_default = has_default_import(b.line)
    local a_is_type = is_type_import(a.line)
    local b_is_type = is_type_import(b.line)
    
    -- Types should come after non-types
    if a_is_type and not b_is_type then
      return false
    elseif not a_is_type and b_is_type then
      return true
    end
    
    -- Default imports come first
    if a_has_default and not b_has_default then
      return true
    elseif not a_has_default and b_has_default then
      return false
    end
    
    -- Alphabetical sort
    return a.line < b.line
  end)

  -- Create final imports array with sorted imports
  local final_imports = {}
  
  -- Add absolute imports first
  for _, import in ipairs(absolute_imports) do
    table.insert(final_imports, import.line)
  end

  -- Add relative imports second
  if #absolute_imports > 0 and #relative_imports > 0 then
    table.insert(final_imports, "")
  end
  for _, import in ipairs(relative_imports) do
    table.insert(final_imports, import.line)
  end
  
  -- Add exactly one empty line after imports if we have imports
  if #absolute_imports > 0 or #relative_imports > 0 then
    table.insert(final_imports, "")
  end

  -- Reconstruct the file content
  local new_content = {}
  
  -- Add pre-import lines
  for _, line in ipairs(pre_import_lines) do
    table.insert(new_content, line)
  end
  
  -- Add imports
  for _, line in ipairs(final_imports) do
    table.insert(new_content, line)
  end
  
  -- Add post-import lines
  for _, line in ipairs(post_import_lines) do
    table.insert(new_content, line)
  end

  -- Update buffer
  vim.api.nvim_buf_set_lines(0, 0, -1, false, new_content)
  
  -- Run organize imports to clean up any unused imports
  organize_imports()
end

typescript.setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = {
    on_attach = function(client, bufnr)
      -- Organize imports keymap with custom sorting
      vim.keymap.set("n", "<leader>oi", sort_imports, { buffer = bufnr, desc = "Organize Imports" })
    end,
  },
})
