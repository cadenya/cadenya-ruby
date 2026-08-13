# frozen_string_literal: true

module Cadenya
  module Models
    class MemoryLayerSpec < Cadenya::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::MemoryLayerSpec::Type]
      required :type, enum: -> { Cadenya::MemoryLayerSpec::Type }

      # @!attribute description
      #   Human-readable description of the layer's purpose. Encouraged for user-created
      #   layers; system-managed layers may have a generated description.
      #
      #   @return [String, nil]
      optional :description, String

      response_only do
        # @!attribute agent_id
        #   Server-set on episodic layers: the agent this layer belongs to. Unset for
        #   non-episodic layers.
        #
        #   @return [String]
        required :agent_id, String, api_name: :agentId

        # @!attribute episodic_key
        #   Server-set on episodic layers: the caller-supplied episodic key the layer was
        #   created for. Unset for non-episodic layers.
        #
        #   @return [String]
        required :episodic_key, String, api_name: :episodicKey

        # @!attribute expires_at
        #   For layers with a finite lifetime (e.g., episodic), the time at which the layer
        #   becomes eligible for cleanup. Set by the system; unset for persistent layers.
        #
        #   @return [Time, nil]
        optional :expires_at, Time, api_name: :expiresAt

        # @!attribute system_managed
        #   Server-set. True for layers managed by the system (e.g., episodic layers created
        #   automatically when an objective uses an episodic_key). System-managed layers
        #   cannot be assigned to objective cascades via the API and cannot be mutated by
        #   clients — their lifecycle is controlled entirely by the runtime.
        #
        #   @return [Boolean]
        required :system_managed, Cadenya::Internal::Type::Boolean, api_name: :systemManaged
      end

      # @!method initialize(type:, agent_id:, description: nil, episodic_key:, expires_at: nil, system_managed:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::MemoryLayerSpec} for more details.
      #
      #   @param type [Symbol, Cadenya::Models::MemoryLayerSpec::Type]
      #
      #   @param agent_id [String] Server-set on episodic layers: the agent this layer belongs to. Unset for
      #
      #   @param description [String] Human-readable description of the layer's purpose. Encouraged for
      #
      #   @param episodic_key [String] Server-set on episodic layers: the caller-supplied episodic key the layer
      #
      #   @param expires_at [Time] For layers with a finite lifetime (e.g., episodic), the time at which the
      #
      #   @param system_managed [Boolean] Server-set. True for layers managed by the system (e.g., episodic layers

      # @see Cadenya::Models::MemoryLayerSpec#type
      module Type
        extend Cadenya::Internal::Type::Enum

        MEMORY_LAYER_TYPE_UNSPECIFIED = :MEMORY_LAYER_TYPE_UNSPECIFIED
        MEMORY_LAYER_TYPE_EPISODIC = :MEMORY_LAYER_TYPE_EPISODIC
        MEMORY_LAYER_TYPE_SKILLS = :MEMORY_LAYER_TYPE_SKILLS

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
