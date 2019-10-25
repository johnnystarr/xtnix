
task :run do
  sh 'erb ibm-xt.conf.erb > ibm-xt.conf'
  sh 'dosbox -conf ibm-xt.conf'
end

task :clean do
  sh 'rm -f ibm-xt.conf'
end