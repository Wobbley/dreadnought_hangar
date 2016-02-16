# Dreadnought Hangar

Dreadnought Hangar is built with the [Phoenix Framework](http://www.phoenixframework.org/) which consists of Elixir, HTML, CSS, and Javascript.

## Getting Started

### Requirements
To be able to run Dreadnought Hangar the following is required:
* Elixir
* Erlang
* Phoenix
* Node (Version 5 or higher)
* PostgreSQL (Set the username and password to 'postgres')

Instructions on how all of these are installed can be found [here](http://www.phoenixframework.org/docs/installation).

### Up and Running
Navigate to the folder containing the git repo and do the following:
* Make sure PostgreSQL is running
* Run 'mix deps.get' (Installs Elixir/Erlang dependencies)
* Run 'npm install' (Install Node dependencies)
* Run 'mix ecto.create' (Creates the database in postgreSQL)
* Run 'mix ecto.migrate' (Runs the various SQL scripts to create tables, indices and so on)
* Run 'mix phoenix.server' to start the server
* The site should now be located at [`localhost:4000`](http://localhost:4000)
* (Optional) Use 'mix run priv/repo/seeds.exs' to insert data. It currently only contains ships, and 2 made up abilities/weapons.
