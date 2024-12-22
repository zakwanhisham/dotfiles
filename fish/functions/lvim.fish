function lvim --wraps='env NVIM_APPNAME=lvim nvim' --description 'alias lvim env NVIM_APPNAME=lvim nvim'
  env NVIM_APPNAME=lvim nvim $argv
        
end
