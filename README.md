Welcome to your new dbt project!

## Steps

### Get dbt configured on your computer


Go to ~/.dbt/profiles.yml and configure the connections you intend to use. You can replace it with this to simplify things (you can set the threads to whatever you want):
```yaml
mytestproject:
  outputs:

    dev:
      type: postgres
      threads: 3
      host: localhost
      port: 5432
      user: user
      pass: password
      dbname: test
      schema: public

    prod:
      type: postgres
      threads: 3
      host: localhost
      port: 5432
      user: user
      pass: password
      dbname: user
      schema: public

  target: dev
```

### Start a local instance of Postgres (must have docker):
```shell
nerdctl run --name postgres -p5432:5432 -e POSTGRES_USER=user -e POSTGRES_PASSWORD=password -d postgres:13.0
```

Don't forget to create a "test" database!
Next, create in your data warehouse, create data. Look at the set_up_scripts folder. Use the data_creation.sql file to do this (would need to tweak it depending on your warehouse, should work as is for postgres)

###pip install dependencies if using snowflake, instead of postgres below do: dbt-snowflake==1.2.0
```shell
pip install dbt-core==1.2.0 dbt-postgres==1.2.0
```

### Initiate the project
You can start either from the prebuilt project, or build your own using the following:
```shell
dbt init mytestproject
cd mytestproject  # The project isn't in the root based on how we created it.
```

### Running
To run against prod, use: (dev is default)
```shell
dbt run -t prod
```

To run a specific subfolder of a specific model and a specific file in that folder:
```shell
dbt run -m ADHOC -s string_view
```
Or you can run it like this
```shell
dbt run -s string_view
```
To run the Documentation, run these two commands:
```shell
dbt docs generate
dbt docs serve


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
