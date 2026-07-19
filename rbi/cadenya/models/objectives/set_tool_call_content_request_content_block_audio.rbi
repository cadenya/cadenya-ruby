# typed: strong

module Cadenya
  module Models
    module Objectives
      class SetToolCallContentRequestContentBlockAudio < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::SetToolCallContentRequestContentBlockAudio,
              Cadenya::Internal::AnyHash
            )
          end

        sig do
          returns(Cadenya::Objectives::SetToolCallContentRequestAudioBlock)
        end
        attr_reader :audio

        sig do
          params(
            audio:
              Cadenya::Objectives::SetToolCallContentRequestAudioBlock::OrHash
          ).void
        end
        attr_writer :audio

        sig do
          returns(
            Cadenya::Objectives::SetToolCallContentRequestContentBlockAudio::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            audio:
              Cadenya::Objectives::SetToolCallContentRequestAudioBlock::OrHash,
            type:
              Cadenya::Objectives::SetToolCallContentRequestContentBlockAudio::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(audio:, type:)
        end

        sig do
          override.returns(
            {
              audio: Cadenya::Objectives::SetToolCallContentRequestAudioBlock,
              type:
                Cadenya::Objectives::SetToolCallContentRequestContentBlockAudio::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Cadenya::Objectives::SetToolCallContentRequestContentBlockAudio::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AUDIO =
            T.let(
              :audio,
              Cadenya::Objectives::SetToolCallContentRequestContentBlockAudio::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Objectives::SetToolCallContentRequestContentBlockAudio::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
