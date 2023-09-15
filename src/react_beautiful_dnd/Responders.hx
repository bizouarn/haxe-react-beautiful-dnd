package react_beautiful_dnd;

typedef Responders = {
	@:optional
	dynamic function onBeforeCapture(before:BeforeCapture):Void;
	@:optional
	dynamic function onBeforeDragStart(start:DragStart):Void;
	@:optional
	dynamic function onDragStart(start:DragStart, provided:ResponderProvided):Void;
	@:optional
	dynamic function onDragUpdate(update:DragUpdate, provided:ResponderProvided):Void;
	dynamic function onDragEnd(result:DropResult, provided:ResponderProvided):Void;
};