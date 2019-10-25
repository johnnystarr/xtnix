desc 'Local development tasks'
task default: %w[
  dev:build
  dev:run
  clean
]

desc 'Setup local development environment'
task setup: %w[
  docker:build
]

container = 'xtnix-tools'

# command wrapper using Docker image
def docker_cmd(cmd, container)
  "docker run -it --rm --name #{cmd} -v #{Dir.pwd}/src:/root -w /root #{container} #{cmd}"
end

make   = docker_cmd('make', container)
bin_sh = docker_cmd('sh', container)

namespace :dev do
  desc 'Build XTNIX'
  task :build do
    sh make
  end

  desc 'Connect to container'
  task :connect do
    sh bin_sh
  end

  desc 'Run XTNIX in DOSBox'
  task :run do
    sh 'erb ibm-xt.conf.erb > ibm-xt.conf'
    sh 'dosbox -conf ibm-xt.conf'
  end
end

namespace :release do
  desc 'Create 360K floppy disk of XTNIX'
  task :floppy do
    sh "#{make} floppy"
  end

  desc 'Create ISO for CDROM booting of XTNIX'
  task :iso do
    sh "#{make} iso"
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
  sh 'rm -f src/*.iso'
end
