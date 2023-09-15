package react_beautiful_dnd;

typedef DroppableProps = {
	var droppableId : String;
	@:optional
	var type : String;
	@:optional
	var mode : DroppableMode;
	@:optional
	var isDropDisabled : Bool;
	@:optional
	var isCombineEnabled : Bool;
	@:optional
	var direction : Direction;
	@:optional
	var ignoreContainerClipping : Bool;
	@:optional
	dynamic function renderClone(provided:DraggableProvided, snapshot:DraggableStateSnapshot, rubric:DraggableRubric):react.ReactElement;
	@:optional
	dynamic function getContainerForClone():js.html.Element;
	function children(provided:DroppableProvided, snapshot:DroppableStateSnapshot):react.ReactElement;
};

@:jsRequire("react-beautiful-dnd", "Droppable") extern class Droppable extends react.ReactComponentOfProps<DroppableProps> {
	static var prototype : Droppable;
}