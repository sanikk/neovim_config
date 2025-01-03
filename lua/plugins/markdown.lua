return {
  -- CLI tool, does not require browser
  {
    'ellisonleao/glow.nvim',
    config = true,
    cmd = 'Glow',
  },
  -- Markdown/mermaid. Uses browser.
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    ft = 'markdown',
  },
}
