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
        attr_reader :path

        sig { params(path: String).void }
        attr_writer :path

        sig { params(method_: String, path: String).returns(T.attached_class) }
        def self.new(method_: nil, path: nil)
        end

        sig { override.returns({ method_: String, path: String }) }
        def to_hash
        end
      end
    end
  end
end
