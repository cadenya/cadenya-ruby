# typed: strong

module Cadenya
  class Client < Cadenya::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(String) }
    attr_reader :api_key

    sig { returns(T.nilable(String)) }
    attr_reader :webhook_key

    sig { returns(Cadenya::Resources::AIProviderKeys) }
    attr_reader :ai_provider_keys

    # Manage the authenticated account. Accounts are the top-level organizational unit
    # and contain one or more workspaces.
    sig { returns(Cadenya::Resources::Account) }
    attr_reader :account

    # Operations on profiles, the account-level principals (users, API keys, system)
    # that authenticate against the API.
    sig { returns(Cadenya::Resources::Profiles) }
    attr_reader :profiles

    # Manage AI agents within a workspace. Agents define AI behavior and tool access.
    sig { returns(Cadenya::Resources::Agents) }
    attr_reader :agents

    sig { returns(Cadenya::Resources::Objectives) }
    attr_reader :objectives

    # Manage memory layers and their entries. Layers are named containers that can be
    # composed into an objective's memory cascade; entries are the keyed values within
    # a layer. System-managed layers (e.g., episodic layers created by the runtime)
    # cannot be mutated through this API.
    sig { returns(Cadenya::Resources::MemoryLayers) }
    attr_reader :memory_layers

    # Issue short-lived presigned URLs for direct client-to-object-storage uploads.
    # Created uploads can be referenced by id when creating or updating resources that
    # accept binary content (e.g., MemoryEntry).
    sig { returns(Cadenya::Resources::Uploads) }
    attr_reader :uploads

    # Manage LLM models available to a workspace. Models represent provider and family
    # pairs (e.g., "anthropic/claude-sonnet-4.6"). Workspaces are seeded with the
    # supported models and you can enable or disable each one.
    sig { returns(Cadenya::Resources::Models) }
    attr_reader :models

    sig { returns(Cadenya::Resources::Search) }
    attr_reader :search

    # Manage tool sets and the tools they contain. Tool sets group related tools, and
    # tools define specific capabilities available to agents.
    #
    # When a tool set is managed, only API key actors can modify its tools; human
    # (profile) actors cannot.
    sig { returns(Cadenya::Resources::ToolSets) }
    attr_reader :tool_sets

    # Issue, rotate, and revoke API keys for the account, and grant or revoke each
    # key's access to individual workspaces.
    sig { returns(Cadenya::Resources::APIKeys) }
    attr_reader :api_keys

    sig { returns(Cadenya::Resources::WorkspaceSecrets) }
    attr_reader :workspace_secrets

    # Manage workspaces within an account. Workspaces provide organizational grouping
    # and isolation for resources such as agents, tools, and API keys.
    #
    # This is the workspace-scoped, end-user surface. Administrative operations
    # (create / archive workspaces, manage members) live in WorkspaceAdminService
    # under /v1/account/workspaces and require the admin role.
    sig { returns(Cadenya::Resources::Workspaces) }
    attr_reader :workspaces

    # Administer workspaces across the account: create and archive workspaces and
    # manage their membership. These operations are account-scoped and require the
    # admin role (a token whose profile holds the WorkOS admin role); they live under
    # /v1/account/workspaces rather than the workspace-scoped /v1/workspaces tree so
    # an admin can manage any workspace in the account, including ones they are not
    # themselves a member of.
    sig { returns(Cadenya::Resources::WorkspaceAdmin) }
    attr_reader :workspace_admin

    sig { returns(Cadenya::Resources::Webhooks) }
    attr_reader :webhooks

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        webhook_key: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Defaults to `ENV["CADENYA_API_KEY"]`
      api_key: ENV["CADENYA_API_KEY"],
      # Defaults to `ENV["CADENYA_WEBHOOK_KEY"]`
      webhook_key: ENV["CADENYA_WEBHOOK_KEY"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["CADENYA_BASE_URL"]`
      base_url: ENV["CADENYA_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Cadenya::Client::DEFAULT_MAX_RETRIES,
      timeout: Cadenya::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Cadenya::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Cadenya::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
