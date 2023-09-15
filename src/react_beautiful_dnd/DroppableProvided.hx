package react_beautiful_dnd;

typedef DroppableProvidedProps = {
	@:native("data-rbd-droppable-context-id")
	var data_rbd_droppable_context_id : String;
	@:native("data-rbd-droppable-id")
	var data_rbd_droppable_id : String;
};

typedef DroppableProvided = {
	dynamic function innerRef(element:Null<js.html.Element>):Void;
	var placeholder : Dynamic;
	var droppableProps : DroppableProvidedProps;
};