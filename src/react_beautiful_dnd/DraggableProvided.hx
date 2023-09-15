package react_beautiful_dnd;

import react.ReactEvent;

typedef DraggableProvidedDragHandleProps = {
	@:native("data-rbd-drag-handle-draggable-id")
	var data_rbd_drag_handle_draggable_id : String;
	@:native("data-rbd-drag-handle-context-id")
	var data_rbd_drag_handle_context_id : String;
	@:native("aria-describedby")
	var aria_describedby : String;
	var role : String;
	var tabIndex : Float;
	var draggable : Bool;
	dynamic function onDragStart(event:react.ReactEvent):Void;
};

typedef DraggableProvidedDraggableProps = {
	@:optional
	var style : ts.AnyOf2<NotDraggingStyle, DraggingStyle>;
	@:native("data-rbd-draggable-context-id")
	var data_rbd_draggable_context_id : String;
	@:native("data-rbd-draggable-id")
	var data_rbd_draggable_id : String;
	@:optional
	dynamic function onTransitionEnd(event:react.ReactEvent):Void;
};

typedef DraggableProvided = {
	dynamic function innerRef(element:Null<js.html.Element>):Void;
	var draggableProps : DraggableProvidedDraggableProps;
	var dragHandleProps : Null<DraggableProvidedDragHandleProps>;
};