name "web_server"
description "Builds a web server for Rails apps"
run_list( [
  "recipe[nginx]",
  "recipe[couchdb::source]",
  "recipe[git]",
  "recipe[redis::install_from_package]",
  "recipe[github_keys]",
  "recipe[wkhtmltopdf-update]",
	"recipe[memcached]",
  "recipe[nodejs]",
  "recipe[forever]",
  "recipe[rvm::system]"
           ]
           )

default_attributes "teammight" => { "app" => 'TeamMight' }




override_attributes(
  "github"=> {
    "repository"=> "git@github.com=>dmytro/TeamMight.git"
  },

  "rails"=> {
    "path" => "/home/ubuntu/apps/TeamMight"
  },

  'rvm' => {
    "rubies" => ["1.9.3-p547-falcon"],
    "default_ruby" => "1.9.3-p547-falcon",
    'global_gems' => [

          { 'name' => 'bundler'},

          { 'name' => 'rake'}

         ]
  },

  'couch_db' => {
    'config'  => {
      'httpd' => {
        'bind_address'=> "0.0.0.0"
      }
    }
  },

  "java" => {
    "install_flavor" => "oracle", "jdk_version" => "7", "oracle" => { "accept_oracle_download_terms" => true }
  }
)
