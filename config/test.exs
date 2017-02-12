use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :title_ix_waivers, TitleIxWaivers.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :title_ix_waivers, TitleIxWaivers.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "title_ix_waivers_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
