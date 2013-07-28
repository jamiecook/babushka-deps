dep 'existing postgres db', :username, :db_name do
  requires 'postgres access'.with(:username => username)
  met? {
    !shell("psql -l") {|shell|
      shell.stdout.split("\n").grep(/^\s*#{db_name}\s+\|/)
    }.empty?
  }
  meet {
    sudo "createdb -O '#{username}' '#{db_name}'", :as => 'postgres'
  }
end