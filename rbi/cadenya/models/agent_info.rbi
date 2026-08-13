# typed: strong

module Cadenya
  module Models
    class AgentInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::AgentInfo, Cadenya::Internal::AnyHash) }

      # A profile identifies a user or non-human principal (such as an API key) at the
      # account level. Profiles are account-scoped and can be granted access to multiple
      # workspaces.
      sig { returns(T.nilable(Cadenya::Profile)) }
      attr_reader :created_by

      sig { params(created_by: Cadenya::Profile::OrHash).void }
      attr_writer :created_by

      sig { returns(Integer) }
      attr_accessor :variation_count

      # AgentInfo contains simple information about an agent for display or quick
      # reference
      sig do
        params(
          variation_count: Integer,
          created_by: Cadenya::Profile::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        variation_count:,
        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        created_by: nil
      )
      end

      sig do
        override.returns(
          { created_by: Cadenya::Profile, variation_count: Integer }
        )
      end
      def to_hash
      end
    end
  end
end
