# typed: strong

module Cadenya
  module Models
    class Widget < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::Widget, Cadenya::Internal::AnyHash) }

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :metadata

      # WidgetSpec is the user-provided configuration for a widget.
      sig { returns(Cadenya::WidgetSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::WidgetSpec::OrHash).void }
      attr_writer :spec

      # WidgetInfo provides read-only server-derived data about a widget.
      sig { returns(T.nilable(Cadenya::WidgetInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::WidgetInfo::OrHash).void }
      attr_writer :info

      # The current lifecycle state of the widget. Output only. Widgets are created
      # STATE_ACTIVE; use the :archive and :unarchive actions to transition between
      # states.
      sig { returns(Cadenya::Widget::State::TaggedSymbol) }
      attr_accessor :state

      # Widget is an embeddable chat surface bound to a single agent. Each widget owns a
      # globally unique, immutable DNS label under the widgets domain (e.g.
      # "k7m2xq9fp4wn.widgets.cadenya.com"): one widget = one hostname = one origin
      # allowlist = one agent binding. Browsers talk to the widget host with session
      # bearer tokens minted server-side via WidgetSessionService.
      sig do
        params(
          metadata: Cadenya::ResourceMetadata::OrHash,
          spec: Cadenya::WidgetSpec::OrHash,
          state: Cadenya::Widget::State::OrSymbol,
          info: Cadenya::WidgetInfo::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        metadata:,
        # WidgetSpec is the user-provided configuration for a widget.
        spec:,
        # The current lifecycle state of the widget. Output only. Widgets are created
        # STATE_ACTIVE; use the :archive and :unarchive actions to transition between
        # states.
        state:,
        # WidgetInfo provides read-only server-derived data about a widget.
        info: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::ResourceMetadata,
            spec: Cadenya::WidgetSpec,
            state: Cadenya::Widget::State::TaggedSymbol,
            info: Cadenya::WidgetInfo
          }
        )
      end
      def to_hash
      end

      # The current lifecycle state of the widget. Output only. Widgets are created
      # STATE_ACTIVE; use the :archive and :unarchive actions to transition between
      # states.
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Cadenya::Widget::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(:STATE_UNSPECIFIED, Cadenya::Widget::State::TaggedSymbol)
        STATE_ACTIVE =
          T.let(:STATE_ACTIVE, Cadenya::Widget::State::TaggedSymbol)
        STATE_ARCHIVED =
          T.let(:STATE_ARCHIVED, Cadenya::Widget::State::TaggedSymbol)

        sig { override.returns(T::Array[Cadenya::Widget::State::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
