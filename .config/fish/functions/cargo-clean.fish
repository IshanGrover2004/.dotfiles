function cargo-clean --wraps=find\ \~/\ -name\ \"Cargo.toml\"\ -execdir\ cargo\ clean\ \\\; --description alias\ cargo-clean=find\ \~/\ -name\ \"Cargo.toml\"\ -execdir\ cargo\ clean\ \\\;
  find ~/ -name "Cargo.toml" -execdir cargo clean \; $argv
        
end
