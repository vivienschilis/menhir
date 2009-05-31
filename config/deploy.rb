set :application, "tribu"
set :deploy_to,  "/home/vivien/public_html/tribu.chipiu.org/#{application}"

set :scm, :git
set :repository,  "git@174.143.232.71:#{application}.git"
set :branch, "master"

role :app, "174.143.232.71"
role :web, "174.143.232.71"
role :db,  "174.143.232.71", :primary => true

set :user, "deploy"
set :password, "strafigatadeploy"

set :use_sudo, false