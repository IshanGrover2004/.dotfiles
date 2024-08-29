function pys --wraps='python -m http.server 8000' --description 'alias pys=python -m http.server 8000'
  python -m http.server 8000 $argv
        
end
