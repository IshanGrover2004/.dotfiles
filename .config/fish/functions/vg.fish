function vg --wraps='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt ' --wraps='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose' --description 'alias vg=valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose'
  valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose $argv
        
end
