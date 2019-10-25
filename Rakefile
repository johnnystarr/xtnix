desc 'Local development tasks'
task default: %w[
  dev:build
]

desc 'Setup local development environment'
task setup: %w[
  docker:build
]

container = 'xtnix-tools'

# make wrapper using Docker image
make = "docker run -it --rm --name make -v #{Dir.pwd}/src:/root -w /root #{container} make"

namespace :dev do
  desc 'Build XTNIX'
  task :build do
    sh make
  end

  desc 'Run XTNIX in DOSBox'
  task :run do
    sh 'erb ibm-xt.conf.erb > ibm-xt.conf'
    sh 'dosbox -conf ibm-xt.conf'
  end
end

namespace :release do
  desc 'Create 360K floppy disk of XTNIX'
  task :disk do
    sh "#{make} floppy"
  end
end

namespace :docker do
  desc 'Build local Docker image'
  task :build do
    sh "docker build -t #{container}:latest ."
  end
end

desc 'Cleanup local files'
task :clean do
  sh 'rm -f ibm-xt.conf'
  sh 'rm -f dist/*'
  sh 'rm -f src/*.com'
  sh 'rm -f src/*.flp'
end
