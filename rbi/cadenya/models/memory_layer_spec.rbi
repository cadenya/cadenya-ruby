# typed: strong

module Cadenya
  module Models
    class MemoryLayerSpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::MemoryLayerSpec, Cadenya::Internal::AnyHash)
        end

      sig { returns(Cadenya::MemoryLayerSpec::Type::OrSymbol) }
      attr_accessor :type

      # Human-readable description of the layer's purpose. Encouraged for user-created
      # layers; system-managed layers may have a generated description.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Server-set on episodic layers: the agent this layer belongs to. Unset for
      # non-episodic layers.
      sig { returns(String) }
      attr_accessor :agent_id

      # Server-set on episodic layers: the caller-supplied episodic key the layer was
      # created for. Unset for non-episodic layers.
      sig { returns(String) }
      attr_accessor :episodic_key

      # For layers with a finite lifetime (e.g., episodic), the time at which the layer
      # becomes eligible for cleanup. Set by the system; unset for persistent layers.
      sig { returns(T.nilable(Time)) }
      attr_reader :expires_at

      sig { params(expires_at: Time).void }
      attr_writer :expires_at

      # Server-set. True for layers managed by the system (e.g., episodic layers created
      # automatically when an objective uses an episodic_key). System-managed layers
      # cannot be assigned to objective cascades via the API and cannot be mutated by
      # clients — their lifecycle is controlled entirely by the runtime.
      sig { returns(T::Boolean) }
      attr_accessor :system_managed

      sig do
        params(
          type: Cadenya::MemoryLayerSpec::Type::OrSymbol,
          agent_id: String,
          episodic_key: String,
          system_managed: T::Boolean,
          description: String,
          expires_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        type:,
        # Server-set on episodic layers: the agent this layer belongs to. Unset for
        # non-episodic layers.
        agent_id:,
        # Server-set on episodic layers: the caller-supplied episodic key the layer was
        # created for. Unset for non-episodic layers.
        episodic_key:,
        # Server-set. True for layers managed by the system (e.g., episodic layers created
        # automatically when an objective uses an episodic_key). System-managed layers
        # cannot be assigned to objective cascades via the API and cannot be mutated by
        # clients — their lifecycle is controlled entirely by the runtime.
        system_managed:,
        # Human-readable description of the layer's purpose. Encouraged for user-created
        # layers; system-managed layers may have a generated description.
        description: nil,
        # For layers with a finite lifetime (e.g., episodic), the time at which the layer
        # becomes eligible for cleanup. Set by the system; unset for persistent layers.
        expires_at: nil
      )
      end

      sig do
        override.returns(
          {
            type: Cadenya::MemoryLayerSpec::Type::OrSymbol,
            agent_id: String,
            description: String,
            episodic_key: String,
            expires_at: Time,
            system_managed: T::Boolean
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::MemoryLayerSpec::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MEMORY_LAYER_TYPE_UNSPECIFIED =
          T.let(
            :MEMORY_LAYER_TYPE_UNSPECIFIED,
            Cadenya::MemoryLayerSpec::Type::TaggedSymbol
          )
        MEMORY_LAYER_TYPE_EPISODIC =
          T.let(
            :MEMORY_LAYER_TYPE_EPISODIC,
            Cadenya::MemoryLayerSpec::Type::TaggedSymbol
          )
        MEMORY_LAYER_TYPE_SKILLS =
          T.let(
            :MEMORY_LAYER_TYPE_SKILLS,
            Cadenya::MemoryLayerSpec::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::MemoryLayerSpec::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
