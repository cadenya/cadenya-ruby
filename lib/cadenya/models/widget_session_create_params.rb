# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::WidgetSessions#create
    class WidgetSessionCreateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!attribute spec
      #   WidgetSessionSpec is the configuration of a session, fixed at mint.
      #
      #   @return [Cadenya::Models::WidgetSessionSpec]
      required :spec, -> { Cadenya::WidgetSessionSpec }

      # @!attribute metadata
      #   CreateOperationMetadata contains the user-provided fields for creating an
      #   operation. Read-only fields (id, account_id, workspace_id, created_at,
      #   profile_id) are excluded since they are set by the server.
      #
      #   @return [Cadenya::Models::CreateOperationMetadata, nil]
      optional :metadata, -> { Cadenya::CreateOperationMetadata }

      # @!attribute secrets
      #   Secrets to attach to the session.
      #
      #   @return [Array<Cadenya::Models::WidgetSessionCreateParams::Secret>, nil]
      optional :secrets, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::WidgetSessionCreateParams::Secret] }

      # @!method initialize(spec:, workspace_id: nil, metadata: nil, secrets: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::WidgetSessionCreateParams} for more details.
      #
      #   @param spec [Cadenya::Models::WidgetSessionSpec] WidgetSessionSpec is the configuration of a session, fixed at mint.
      #
      #   @param workspace_id [String]
      #
      #   @param metadata [Cadenya::Models::CreateOperationMetadata] CreateOperationMetadata contains the user-provided fields for creating
      #
      #   @param secrets [Array<Cadenya::Models::WidgetSessionCreateParams::Secret>] Secrets to attach to the session.
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      class Secret < Cadenya::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute value
        #
        #   @return [String, nil]
        optional :value, String

        # @!method initialize(name: nil, value: nil)
        #   Secret is a named credential attached to the session — typically a token the
        #   customer's backend minted for the visitor, so the agent acts against their API
        #   as that subject. Values are captured at the boundary, encrypted at rest,
        #   appended to every conversation the session creates (re-synced on each turn), and
        #   never returned by any API. Session secrets take precedence over workspace and
        #   tool-set secrets of the same name.
        #
        #   @param name [String]
        #   @param value [String]
      end
    end
  end
end
