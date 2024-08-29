function up --wraps='yay -Syu --noconfirm && rustup update && rm -rf ~/.cache/' --description 'alias up yay -Syu --noconfirm && rustup update && rm -rf ~/.cache/'
  yay -Syu --noconfirm && rustup update && rm -rf ~/.cache/ $argv
        
end
