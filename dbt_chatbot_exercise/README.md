# DBT Chatbot Exercise

Please create a file called `profiles.yml` file in the `~/.dbt/` folder. You can use the following commands:

```sh
touch .dbt/profiles.yml
```
Copy and past the following content into the file and don't forget to add your project ID.

```yml
dbt_chatbot_exercise:
  outputs:
    dev:
      host: localhost
      location: EU
      method: oauth
      project: <enter-your-project-ID>
      schema: dbt_chatbot
      threads: 4
      type: bigquery
  target: dev
```