name 'couchdb'

description "latest couchdb"



run_list ["recipe[couchdb::source]"]
