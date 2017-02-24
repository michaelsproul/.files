set disassembly-flavor intel
set startup-with-shell off

python
print "-- Loading Rust pretty-printers --"
sys.path.insert(0, "/Users/michael/Applications/rust-gdb")
import gdb_rust_pretty_printing
gdb_rust_pretty_printing.register_printers(gdb)
end

fs CMD
