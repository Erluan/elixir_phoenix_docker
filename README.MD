# Docker Files to Create An Elixir Phoenix Application with MySQL Database #

### Installation and Initialization
Clone the repository and execute to build the image:
```bash
docker-compose build
```
Create a "src" directory:
```bash
mkdir src
```
And then, you will need to create a "mix" command alias (If you previosly installed the Elixir with apt install, you will overwrite the 'mix' command) executing the following command:
```bash
alias mix="docker-compose run --rm phoenix mix"
```
Now, you need to Initialize your new 'Hello' Phoenix Application:
```bash
mix phx.new . --app hello --database mysql
```
If you want to create a RESTFUL API Service, use the following command:
```bash
mix phx.new . hello_api --no-webpack --no-html --database mysql
```

Note that '--database mysql' was used in the commands above, because the default database setup in Elixir Phoenix is for PostgreSQL, and MySQL was chosen here for testing purposes, but make yourself confortable on going with with MySQL if your database is already MySQL or want to use it in your Stack.

### Setting up the Database Configuration
Change the database hostname configuration on file 'src/config/dev.exs' and set your Database Configuration, accoding to the DB set in your 'environment' in 'docker-compose'

**Note:**
Using MySQL, you need to import an Ecto Adapter to connect to the Database with your 'environment' setup:
```bash
config :hello, Hello.Repo,
  adapter: Ecto.Adapters.MySQL,
```

Then, you can initialize the database with Ecto:
```bash
cd src
mix ecto.create
```

If you copied an existing application, you can run a database migrations:
```bash
mix ecto.migrate
```

### Start your Application
The application is ready to Start! Now, go back to the project root directory and start up application:
```bash
cd ..
docker-compose up
```

Now, you can access the application under the http://localhost:4000

### Notes
You can change the ports and db configurations in the 'docker-compose.yml' file

Good Work ;)