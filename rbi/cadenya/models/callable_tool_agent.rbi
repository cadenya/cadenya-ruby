# typed: strong

module Cadenya
  module Models
    class CallableToolAgent < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::CallableToolAgent, Cadenya::Internal::AnyHash)
        end

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :agent

      sig { params(agent: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :agent

      sig { returns(Cadenya::CallableToolAgent::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          agent: Cadenya::ResourceMetadata::OrHash,
          type: Cadenya::CallableToolAgent::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        agent:,
        type:
      )
      end

      sig do
        override.returns(
          {
            agent: Cadenya::ResourceMetadata,
            type: Cadenya::CallableToolAgent::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::CallableToolAgent::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AGENT = T.let(:agent, Cadenya::CallableToolAgent::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::CallableToolAgent::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
