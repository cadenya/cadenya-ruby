# typed: strong

module Cadenya
  module Models
    ObjectiveToolCallResultContentBlockAudio =
      Objectives::ObjectiveToolCallResultContentBlockAudio

    module Objectives
      class ObjectiveToolCallResultContentBlockAudio < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveToolCallResultContentBlockAudio,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(Cadenya::Objectives::ObjectiveToolCallResultAudioBlock) }
        attr_reader :audio

        sig do
          params(
            audio:
              Cadenya::Objectives::ObjectiveToolCallResultAudioBlock::OrHash
          ).void
        end
        attr_writer :audio

        sig do
          returns(
            Cadenya::Objectives::ObjectiveToolCallResultContentBlockAudio::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            audio:
              Cadenya::Objectives::ObjectiveToolCallResultAudioBlock::OrHash,
            type:
              Cadenya::Objectives::ObjectiveToolCallResultContentBlockAudio::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(audio:, type:)
        end

        sig do
          override.returns(
            {
              audio: Cadenya::Objectives::ObjectiveToolCallResultAudioBlock,
              type:
                Cadenya::Objectives::ObjectiveToolCallResultContentBlockAudio::Type::TaggedSymbol
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
                Cadenya::Objectives::ObjectiveToolCallResultContentBlockAudio::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AUDIO =
            T.let(
              :audio,
              Cadenya::Objectives::ObjectiveToolCallResultContentBlockAudio::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Objectives::ObjectiveToolCallResultContentBlockAudio::Type::TaggedSymbol
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
