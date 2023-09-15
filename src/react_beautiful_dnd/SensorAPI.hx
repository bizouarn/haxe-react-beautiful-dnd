package react_beautiful_dnd;

typedef SensorAPI = {
	dynamic function tryGetLock(draggableId:String, ?forceStop:() -> Void, ?options:TryGetLockOptions):Null<PreDragActions>;
	dynamic function canGetLock(id:String):Bool;
	dynamic function isLockClaimed():Bool;
	dynamic function tryReleaseLock():Void;
	dynamic function findClosestDraggableId(event:js.html.Event):Null<String>;
	dynamic function findOptionsForDraggable(id:String):Null<DraggableOptions>;
};