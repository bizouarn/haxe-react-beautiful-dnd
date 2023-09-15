package react_beautiful_dnd;

typedef DraggableProps = {
	var draggableId : String;
	var index : Float;
	dynamic function children(provided:DraggableProvided, snapshot:DraggableStateSnapshot, rubric:DraggableRubric):react.ReactElement<js.html.Element, ts.AnyOf4<String, (props:Dynamic) -> Null<react.ReactElement<Dynamic, Dynamic>>, (props:Dynamic, deprecatedLegacyContext:Dynamic) -> Null<react.ReactElement<Dynamic, Dynamic>>, { }>>;
	@:optional
	var isDragDisabled : Bool;
	@:optional
	var disableInteractiveElementBlocking : Bool;
	@:optional
	var shouldRespectForcePress : Bool;
};