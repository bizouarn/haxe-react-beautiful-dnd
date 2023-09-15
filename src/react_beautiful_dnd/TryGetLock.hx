package react_beautiful_dnd;

typedef TryGetLock = ts.AnyOf3<(draggableId:String) -> Null<PreDragActions>, (draggableId:String, forceStop:() -> Void) -> Null<PreDragActions>, (draggableId:String, forceStop:() -> Void, options:TryGetLockOptions) -> Null<PreDragActions>>;