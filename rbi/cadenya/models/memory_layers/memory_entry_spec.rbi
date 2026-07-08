# typed: strong

module Cadenya
  module Models
    module MemoryLayers
      class MemoryEntrySpec < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::MemoryLayers::MemoryEntrySpec,
              Cadenya::Internal::AnyHash
            )
          end

        # The lookup key for this entry within its layer. Must conform to the S3 object
        # key safe-characters spec: ASCII alphanumerics and the special characters !, -,
        # \_, ., \*, ', (, ), and /. Forward slashes may be used to suggest hierarchy
        # (e.g., "skills/postmortem/write"), but lookups are flat — the key is a single
        # opaque string, not a path.
        #
        # Additional rules enforced by the service:
        #
        # - May not begin or end with /
        # - May not contain consecutive slashes (//)
        # - May not begin with reserved prefixes (cadenya/, system/)
        # - Case-sensitive
        # - Unique within the parent layer
        #
        # For skills entries, this key is what the model passes to get_memory to load the
        # entry's content.
        sig { returns(String) }
        attr_accessor :key

        # One-line "when to use this" hint shown in the frontmatter manifest for skills
        # entries. The model uses this to decide whether to load the body, so it should be
        # written for the model as the audience. Ignored for layer types that do not
        # advertise frontmatter.
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # MemoryEntrySpec is the metadata portion of an entry — the fields that identify
        # and describe it, without the body. It appears on both the summary (MemoryEntry)
        # and detail (MemoryEntryDetail) views.
        sig do
          params(key: String, description: String).returns(T.attached_class)
        end
        def self.new(
          # The lookup key for this entry within its layer. Must conform to the S3 object
          # key safe-characters spec: ASCII alphanumerics and the special characters !, -,
          # \_, ., \*, ', (, ), and /. Forward slashes may be used to suggest hierarchy
          # (e.g., "skills/postmortem/write"), but lookups are flat — the key is a single
          # opaque string, not a path.
          #
          # Additional rules enforced by the service:
          #
          # - May not begin or end with /
          # - May not contain consecutive slashes (//)
          # - May not begin with reserved prefixes (cadenya/, system/)
          # - Case-sensitive
          # - Unique within the parent layer
          #
          # For skills entries, this key is what the model passes to get_memory to load the
          # entry's content.
          key:,
          # One-line "when to use this" hint shown in the frontmatter manifest for skills
          # entries. The model uses this to decide whether to load the body, so it should be
          # written for the model as the audience. Ignored for layer types that do not
          # advertise frontmatter.
          description: nil
        )
        end

        sig { override.returns({ key: String, description: String }) }
        def to_hash
        end
      end
    end
  end
end
