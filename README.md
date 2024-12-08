

## 📌 Leader Key

- **Leader Key:** `<Space>`

  All custom shortcuts are prefixed with the leader key, which is set to the spacebar (`<Space>`).

---

## 🧭 General Navigation

### **Movement Keys**

- **H/J/K/L:**  
  Use `h`, `j`, `k`, and `l` for left, down, up, and right movements respectively.
  
- **Arrow Keys (Disabled in Normal Mode):**
  
  | Key         | Action                                   |
  |-------------|------------------------------------------|
  | `<Left>`    | Displays message: "Use h to move!!"      |
  | `<Down>`    | Displays message: "Use j to move!!"      |
  | `<Up>`      | Displays message: "Use k to move!!"      |
  | `<Right>`   | Displays message: "Use l to move!!"      |
  
  *Rationale:* Encourages the use of `h`, `j`, `k`, `l` for more efficient navigation.

---

## 🪟 Window Management

### **Switching Between Windows**

Use `Ctrl` combined with `h`, `j`, `k`, or `l` to move focus between split windows.

| Key Combination | Action                           |
|-----------------|----------------------------------|
| `<C-h>`         | Move focus to the **left** window |
| `<C-j>`         | Move focus to the **lower** window |
| `<C-k>`         | Move focus to the **upper** window |
| `<C-l>`         | Move focus to the **right** window |

---

## 📂 Buffer Management

### **Navigating Buffers**

| Key Combination | Action            |
|-----------------|-------------------|
| `<Tab>`         | Switch to **next** buffer |
| `<S-Tab>`       | Switch to **previous** buffer |
| `<leader>q`     | **Close** current buffer |
| `<leader>wq`    | **Close** current window |

*Note:* There is a potential overlap with `<leader>q`, which is also mapped to open the diagnostic quickfix list. Ensure this aligns with your workflow or consider adjusting one of the bindings to avoid conflicts.

---

## 🔍 Searching with Telescope

### **Telescope Shortcuts**

Utilize the powerful Telescope plugin for various search functionalities.

| Key Combination | Action                                     |
|-----------------|--------------------------------------------|
| `<leader>sh`    | **Search Help** (`:Telescope help_tags`)   |
| `<leader>sk`    | **Search Keymaps** (`:Telescope keymaps`)  |
| `<leader>sf`    | **Search Files** (`:Telescope find_files`) |
| `<leader>ss`    | **Search Telescope** selections            |
| `<leader>sw`    | **Search Current Word** (`:Telescope grep_string`) |
| `<leader>sg`    | **Live Grep** (`:Telescope live_grep`)    |
| `<leader>sd`    | **Search Diagnostics** (`:Telescope diagnostics`) |
| `<leader>sr`    | **Resume Last Search** (`:Telescope resume`) |
| `<leader>s.`    | **Search Recent Files** (`:Telescope oldfiles`) |
| `<leader><leader>` | **Find Existing Buffers** (`:Telescope buffers`) |
| `<leader>/`     | **Fuzzily Search in Current Buffer**       |
| `<leader>s/`    | **Search in Open Files**                   |
| `<leader>sn`    | **Search Neovim Config Files** (`:Telescope find_files` with config path) |

---

## 🛠️ LSP (Language Server Protocol) Keymaps

### **Navigating Code with LSP**

These keybindings become active when an LSP server is attached to the current buffer.

| Key Combination | Action                                     |
|-----------------|--------------------------------------------|
| `gd`            | **Go to Definition** (`Telescope lsp_definitions`) |
| `gr`            | **Go to References** (`Telescope lsp_references`) |
| `gI`            | **Go to Implementation** (`Telescope lsp_implementations`) |
| `<leader>D`     | **Type Definition** (`Telescope lsp_type_definitions`) |
| `<leader>ds`    | **Document Symbols** (`Telescope lsp_document_symbols`) |
| `<leader>ws`    | **Workspace Symbols** (`Telescope lsp_dynamic_workspace_symbols`) |
| `<leader>rn`    | **Rename** (`vim.lsp.buf.rename`) |
| `<leader>ca`    | **Code Action** (`vim.lsp.buf.code_action`) |
| `gD`            | **Go to Declaration** (`vim.lsp.buf.declaration`) |
| `<leader>th`    | **Toggle Inlay Hints** |

*Additional Features:*

- **Document Highlighting:** Automatically highlights references of the word under the cursor.
- **Inlay Hints:** Toggle visibility of inlay hints if supported by the language server.

---

## 📝 Editing and Formatting

### **Format Buffer**

| Key Combination | Action            |
|-----------------|-------------------|
| `<leader>f`     | **Format Buffer** (`Conform.nvim`) |

*Description:* Formats the current buffer asynchronously, using LSP as a fallback if available.

---

## 🗂️ File Explorer

### **MiniFiles Shortcuts**

| Key Combination | Action                         |
|-----------------|--------------------------------|
| `<leader>e`     | **Open MiniFiles Explorer**    |
| `q` (within Explorer) | **Close MiniFiles Explorer** |

*Usage:* Navigate and manage files within the MiniFiles explorer interface.

---

## 🖥️ Terminal Management

### **Terminal Shortcuts**

| Key Combination | Action                           |
|-----------------|----------------------------------|
| `<C-i>` (Normal & Terminal) | **Toggle Terminal** (`Term`) |
| `<C-g>` (Normal & Terminal) | **Toggle LazyGit** (`Term lazygit`) |
| `<Esc><Esc>` (Terminal) | **Exit Terminal Mode** (`<C-\><C-n>`) |

*Description:* Provides easy access to terminal functionalities without relying on complex default shortcuts.

---

## ⚙️ Additional Keymaps

### **Search Highlights**

- **Clear Search Highlights:**

  | Key Combination | Action                    |
  |-----------------|---------------------------|
  | `<Esc>`         | **Clear Search Highlights** (`:nohlsearch`) |

### **Diagnostics**

| Key Combination | Action                                |
|-----------------|---------------------------------------|
| `<leader>q`     | **Open Diagnostic Quickfix List** (`vim.diagnostic.setloclist`) |

*Note:* As mentioned earlier, `<leader>q` is mapped both for diagnostics and closing buffers. Ensure that this dual functionality is intended or adjust the mappings accordingly.

---

## 📢 Summary of Disabled or Modified Defaults

- **Arrow Keys:** Disabled in normal mode to promote the use of `h`, `j`, `k`, `l` for navigation, enhancing efficiency.
- **Mouse Mode:** Enabled (`vim.opt.mouse = 'a'`), allowing for mouse interactions like resizing splits.
- **Clipboard Synchronization:** Enabled (`vim.opt.clipboard = 'unnamedplus'`) to sync between OS and Neovim.
- **Line Numbers:** Both absolute (`number`) and relative (`relativenumber`) line numbers are enabled for better navigation.

---

## 📌 Final Notes

- **Which-Key Integration:** The `which-key.nvim` plugin provides a popup displaying available keybindings, enhancing discoverability.
- **Potential Keybinding Conflicts:** Be cautious of overlapping keybindings (e.g., `<leader>q`), which might lead to unexpected behaviors. Consider customizing or resolving these overlaps based on your workflow preferences.
- **Customization:** Feel free to modify or extend these keybindings to better suit your personal coding habits and project requirements.

---

By leveraging these keybindings, you can navigate and edit your code more efficiently within Neovim, making the most out of your development environment.
