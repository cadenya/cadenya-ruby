# frozen_string_literal: true

module Cadenya
  class Client < Cadenya::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # @return [String]
    attr_reader :api_key

    # @return [String, nil]
    attr_reader :webhook_key

    # @return [Cadenya::Resources::AIProviderKeys]
    attr_reader :ai_provider_keys

    # Manage the authenticated account. Accounts are the top-level organizational unit
    # and contain one or more workspaces.
    # @return [Cadenya::Resources::Account]
    attr_reader :account

    # Operations on profiles, the account-level principals (users, API keys, system)
    # that authenticate against the API.
    # @return [Cadenya::Resources::Profiles]
    attr_reader :profiles

    # Manage AI agents within a workspace. Agents define AI behavior and tool access.
    # @return [Cadenya::Resources::Agents]
    attr_reader :agents

    # @return [Cadenya::Resources::Objectives]
    attr_reader :objectives

    # Manage memory layers and their entries. Layers are named containers that can be
    # composed into an objective's memory cascade; entries are the keyed values within
    # a layer. System-managed layers (e.g., episodic layers created by the runtime)
    # cannot be mutated through this API.
    # @return [Cadenya::Resources::MemoryLayers]
    attr_reader :memory_layers

    # Issue short-lived presigned URLs for direct client-to-object-storage uploads.
    # Created uploads can be referenced by id when creating or updating resources that
    # accept binary content (e.g., MemoryEntry).
    # @return [Cadenya::Resources::Uploads]
    attr_reader :uploads

    # Manage LLM models available to a workspace. Models represent provider and family
    # pairs (e.g., "anthropic/claude-sonnet-4.6"). Workspaces are seeded with the
    # supported models and you can enable or disable each one.
    # @return [Cadenya::Resources::Models]
    attr_reader :models

    # @return [Cadenya::Resources::Search]
    attr_reader :search

    # Manage tool sets and the tools they contain. Tool sets group related tools, and
    # tools define specific capabilities available to agents.
    #
    # When a tool set is managed, only API key actors can modify its tools; human
    # (profile) actors cannot.
    # @return [Cadenya::Resources::ToolSets]
    attr_reader :tool_sets

    # Issue, rotate, and revoke API keys for the account, and grant or revoke each
    # key's access to individual workspaces.
    # @return [Cadenya::Resources::APIKeys]
    attr_reader :api_keys

    # @return [Cadenya::Resources::WorkspaceSecrets]
    attr_reader :workspace_secrets

    # Manage workspaces within an account. Workspaces provide organizational grouping
    # and isolation for resources such as agents, tools, and API keys.
    #
    # This is the workspace-scoped, end-user surface. Administrative operations
    # (create / archive workspaces, manage members) live in WorkspaceAdminService
    # under /v1/account/workspaces and require the admin role.
    # @return [Cadenya::Resources::Workspaces]
    attr_reader :workspaces

    # Administer workspaces across the account: create and archive workspaces and
    # manage their membership. These operations are account-scoped and require the
    # admin role (a token whose profile holds the WorkOS admin role); they live under
    # /v1/account/workspaces rather than the workspace-scoped /v1/workspaces tree so
    # an admin can manage any workspace in the account, including ones they are not
    # themselves a member of.
    # @return [Cadenya::Resources::WorkspaceAdmin]
    attr_reader :workspace_admin

    # @return [Cadenya::Resources::Webhooks]
    attr_reader :webhooks

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @api_key.nil?

      {"authorization" => "Bearer #{@api_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Defaults to `ENV["CADENYA_API_KEY"]`
    #
    # @param webhook_key [String, nil] Defaults to `ENV["CADENYA_WEBHOOK_KEY"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["CADENYA_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["CADENYA_API_KEY"],
      webhook_key: ENV["CADENYA_WEBHOOK_KEY"],
      base_url: ENV["CADENYA_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.cadenya.com"

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"CADENYA_API_KEY\"")
      end

      headers = {}
      custom_headers_env = ENV["CADENYA_CUSTOM_HEADERS"]
      unless custom_headers_env.nil?
        parsed = {}
        custom_headers_env.split("\n").each do |line|
          colon = line.index(":")
          unless colon.nil?
            parsed[line[0...colon].strip] = line[(colon + 1)..].strip
          end
        end
        headers = parsed.merge(headers)
      end

      @api_key = api_key.to_s
      @webhook_key = webhook_key&.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay,
        headers: headers
      )

      @ai_provider_keys = Cadenya::Resources::AIProviderKeys.new(client: self)
      @account = Cadenya::Resources::Account.new(client: self)
      @profiles = Cadenya::Resources::Profiles.new(client: self)
      @agents = Cadenya::Resources::Agents.new(client: self)
      @objectives = Cadenya::Resources::Objectives.new(client: self)
      @memory_layers = Cadenya::Resources::MemoryLayers.new(client: self)
      @uploads = Cadenya::Resources::Uploads.new(client: self)
      @models = Cadenya::Resources::Models.new(client: self)
      @search = Cadenya::Resources::Search.new(client: self)
      @tool_sets = Cadenya::Resources::ToolSets.new(client: self)
      @api_keys = Cadenya::Resources::APIKeys.new(client: self)
      @workspace_secrets = Cadenya::Resources::WorkspaceSecrets.new(client: self)
      @workspaces = Cadenya::Resources::Workspaces.new(client: self)
      @workspace_admin = Cadenya::Resources::WorkspaceAdmin.new(client: self)
      @webhooks = Cadenya::Resources::Webhooks.new(client: self)
    end
  end
end
