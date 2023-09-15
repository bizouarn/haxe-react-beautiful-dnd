package react_beautiful_dnd;

typedef DragDropContextProps = {
	var children:Dynamic;
	@:optional
	var dragHandleUsageInstructions : String;
	@:optional
	var nonce : String;
	@:optional
	var enableDefaultSensors : Bool;
	@:optional
	var sensors : Array<Sensor>;
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

@:jsRequire("react-beautiful-dnd", "DragDropContext") extern class DragDropContext extends react.ReactComponentOfProps<DragDropContextProps> {
	static var prototype : DragDropContext;
}