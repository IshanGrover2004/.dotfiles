function cch --wraps='cargo clippy -- -W clippy::pedantic' --description 'alias cch cargo clippy -- -W clippy::pedantic'
  cargo clippy -- -W clippy::pedantic $argv
        
end
