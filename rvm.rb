dep 'rvm' do
  requires ['rvm installed', 'rvm on path']
end

dep 'rvm installed' do
  met? { 
    "~/.rvm/scripts/rvm".p.file?
  }

  meet {
    shell 'curl -L https://get.rvm.io | bash'
  }
end


dep 'rvm on path' do
  met? {
    `which rvm`
    $?.success?
  }

  meet {
    shell "echo \"
# RVM
[[ -s '/Users/`whoami`/.rvm/scripts/rvm' ]] && source '/Users/`whoami`/.rvm/scripts/rvm'\" >> ~/.bashrc
  source ~/.bashrc"
  }
end

