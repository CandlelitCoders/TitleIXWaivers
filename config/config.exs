# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :title_ix_waivers,
  ecto_repos: [TitleIxWaivers.Repo]

# Configures the endpoint
config :title_ix_waivers, TitleIxWaivers.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/KWPwx0XEwRi4DAgJEFzWu3cGWxSeaBBWWmJbVa2mp2PQjjwmNCGDwSFKj4HqOFB",
  render_errors: [view: TitleIxWaivers.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TitleIxWaivers.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ex_admin,
  repo: TitleIxWaivers.Repo,
  module: TitleIxWaivers,
  modules: [
    TitleIxWaivers.ExAdmin.Dashboard,
    TitleIxWaivers.ExAdmin.User,
    TitleIxWaivers.ExAdmin.Waiver,
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}


# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: TitleIxWaivers.User,
  repo: TitleIxWaivers.Repo,
  module: TitleIxWaivers,
  logged_out_url: "/",
  email_from: {"Your Name", "yourname@example.com"},
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :invitable, :registerable]

config :coherence, TitleIxWaivers.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
