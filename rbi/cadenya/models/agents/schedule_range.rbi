# typed: strong

module Cadenya
  module Models
    module Agents
      class ScheduleRange < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::Agents::ScheduleRange, Cadenya::Internal::AnyHash)
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :end_

        sig { params(end_: Integer).void }
        attr_writer :end_

        sig { returns(T.nilable(Integer)) }
        attr_reader :start

        sig { params(start: Integer).void }
        attr_writer :start

        sig { returns(T.nilable(Integer)) }
        attr_reader :step

        sig { params(step: Integer).void }
        attr_writer :step

        # Inclusive numeric range with optional step. {start: 9} → 9 {start: 9, end: 17} →
        # 9..17 {start: 0, end: 59, step: 15} → 0,15,30,45 `end` defaults to `start`;
        # `step` defaults to 1.
        sig do
          params(end_: Integer, start: Integer, step: Integer).returns(
            T.attached_class
          )
        end
        def self.new(end_: nil, start: nil, step: nil)
        end

        sig do
          override.returns({ end_: Integer, start: Integer, step: Integer })
        end
        def to_hash
        end
      end
    end
  end
end
