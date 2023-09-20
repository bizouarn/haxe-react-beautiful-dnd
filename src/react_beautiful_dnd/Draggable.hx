package react_beautiful_dnd;

typedef DraggableProps = {
	var draggableId : String;
	var index : Float;
	function children(provided:DraggableProvided, snapshot:DraggableStateSnapshot, rubric:DraggableRubric):react.ReactElement;
	@:optional
	var isDragDisabled : Bool;
	@:optional
	var disableInteractiveElementBlocking : Bool;
	@:optional
	var shouldRespectForcePress : Bool;
};

@:jsRequire("react-beautiful-dnd", "Draggable") extern class Draggable extends react.ReactComponentOfProps<DraggableProps> {
	static var prototype : Draggable;
}