import Config

# Configures Swoosh API Client
config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: RosaGrande.Finch

# Disable Swoosh Local Memory Storage
config :swoosh, local: false

# Do not print debug messages in production
config :logger, level: :info

# Runtime production configuration, including reading
# of environment variables, is done on config/runtime.exs.
config :rosa_grande, RosaGrande.Endpoint,
  check_origin: [
    "https://rosa-grande.vercel.app",
    "https://rosagrandetattoo.com",
    "https://www.rosagrandetattoo.com"
  ],
  url: [host: "https://rosangrandetattoo.com", port: 80]
