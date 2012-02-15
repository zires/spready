# Clear console
system 'clear'

# --------------------------------------------------
# Rules
# --------------------------------------------------
watch('test/test_helper\.rb') { run_all_tests }
watch('test/.*/.*_test\.rb') { |m| run_test_file(m[0]) }
# Run related test file
# watch('app/.*/.*\.rb') { |m| related_test_files(m[0]).map {|tf| run_test_file(tf) } }
# watch('features/.*/.*\.feature') { run_all_features }

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\
Signal.trap('QUIT') { run_all_tests }
# Ctrl-C
# Signal.trap('INT' ) { abort("\n") } 
# Before abort, we need run all tests again
Signal.trap('INT' ) do
  if @interrupted
    abort("\n")
  else
    puts "Interrupt a second time to quit"
    @interrupted = true
    Kernel.sleep 1.5
    run_all_tests
  end
end

# --------------------------------------------------
# Helpers
# --------------------------------------------------
def run(cmd)
  puts   cmd
  system cmd
end

def run_all_tests
  system 'clear'
  run    "rake test"
end

def run_test_file(file)
  system 'clear'
  run(%Q(ruby -I"lib:test" -rubygems #{file}))
end