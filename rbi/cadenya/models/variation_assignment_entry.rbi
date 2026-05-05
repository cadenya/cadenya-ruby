# typed: strong

module Cadenya
  module Models
    class VariationAssignmentEntry < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::VariationAssignmentEntry, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :sub_agent_id

      sig { params(sub_agent_id: String).void }
      attr_writer :sub_agent_id

      sig { returns(T.nilable(String)) }
      attr_reader :tool_id

      sig { params(tool_id: String).void }
      attr_writer :tool_id

      sig { returns(T.nilable(String)) }
      attr_reader :tool_set_id

      sig { params(tool_set_id: String).void }
      attr_writer :tool_set_id

      sig do
        params(
          sub_agent_id: String,
          tool_id: String,
          tool_set_id: String
        ).returns(T.attached_class)
      end
      def self.new(sub_agent_id: nil, tool_id: nil, tool_set_id: nil)
      end

      sig do
        override.returns(
          { sub_agent_id: String, tool_id: String, tool_set_id: String }
        )
      end
      def to_hash
      end
    end
  end
end
