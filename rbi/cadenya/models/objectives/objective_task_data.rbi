# typed: strong

module Cadenya
  module Models
    ObjectiveTaskData = Objectives::ObjectiveTaskData

    module Objectives
      class ObjectiveTaskData < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveTaskData,
              Cadenya::Internal::AnyHash
            )
          end

        # Whether the task has been completed
        sig { returns(T::Boolean) }
        attr_accessor :completed

        # Description of the task to be completed
        sig { returns(String) }
        attr_accessor :task

        # The sequential number of this task within the objective (auto-assigned, 1-based)
        sig { returns(Integer) }
        attr_accessor :number

        # Timestamp when the task was marked as completed
        sig { returns(T.nilable(Time)) }
        attr_reader :completed_at

        sig { params(completed_at: Time).void }
        attr_writer :completed_at

        sig do
          params(
            completed: T::Boolean,
            number: Integer,
            task: String,
            completed_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the task has been completed
          completed:,
          # The sequential number of this task within the objective (auto-assigned, 1-based)
          number:,
          # Description of the task to be completed
          task:,
          # Timestamp when the task was marked as completed
          completed_at: nil
        )
        end

        sig do
          override.returns(
            {
              completed: T::Boolean,
              number: Integer,
              task: String,
              completed_at: Time
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
