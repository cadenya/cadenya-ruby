# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ConfigOpenAPI < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSets::ConfigOpenAPI, Cadenya::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :method_

        sig { params(method_: String).void }
        attr_writer :method_

        sig { returns(T.nilable(String)) }
        attr_reader :operation_id

        sig { params(operation_id: String).void }
        attr_writer :operation_id

        sig { returns(T.nilable(String)) }
        attr_reader :path

        sig { params(path: String).void }
        attr_writer :path

        sig do
          params(method_: String, operation_id: String, path: String).returns(
            T.attached_class
          )
        end
        def self.new(method_: nil, operation_id: nil, path: nil)
        end

        sig do
          override.returns(
            { method_: String, operation_id: String, path: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
