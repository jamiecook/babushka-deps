dep 'clone pendulum' do
  pendulum_dir = '~/src/pendulum'
  pendulum_git = Babushka::GitRepo.new(pendulum_dir)
  pendulum_uri = 'git@github.com:benhoskings/pendulum.git'

  met? {
    pendulum_git.exists?
  }

  meet {
    pendulum_git.clone!(pendulum_uri)
  }
end