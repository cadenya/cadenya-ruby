# typed: strong

module Cadenya
  module Models
    module Agents
      class ScheduleInterval < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::Agents::ScheduleInterval, Cadenya::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :every

        sig { params(every: String).void }
        attr_writer :every

        # Phase shift within `every`. Must be < `every` (enforced at runtime).
        sig { returns(T.nilable(String)) }
        attr_reader :offset

        sig { params(offset: String).void }
        attr_writer :offset

        # Interval is a duration-based rule. Fires every `every` from a stable anchor
        # (workspace epoch), optionally phase-shifted by `offset`.
        sig { params(every: String, offset: String).returns(T.attached_class) }
        def self.new(
          every: nil,
          # Phase shift within `every`. Must be < `every` (enforced at runtime).
          offset: nil
        )
        end

        sig { override.returns({ every: String, offset: String }) }
        def to_hash
        end
      end
    end
  end
end
