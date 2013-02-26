
dep 'dot-files installed' do
  met? {
    '~/.dot-files/files/.bashrc'.p.file?
  }

  meet {
    shell "curl -L https://raw.github.com/vlc/dot-files/master/clone_and_link.rb | ruby"
  }
end