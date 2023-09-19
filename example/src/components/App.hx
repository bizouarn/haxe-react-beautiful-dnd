package components;

import react.React;
import react.ReactComponent;
import react.ReactMacro.jsx;

import react_beautiful_dnd.DragDropContext;
import react_beautiful_dnd.Droppable;
import react_beautiful_dnd.Draggable;
import react_beautiful_dnd.DraggableLocation;
import react_beautiful_dnd.DropResult;

private typedef Props = {
	var id: String;
}

private typedef State = {
	var source: Array<String>;
}

class App extends react.ReactComponentOf<Props, State> {

	public function new(props: Props) {
		super(props);
		var source = ["TEST 1", "TEST 2", "TEST 3", "TEST 4", "TEST 5", "TEST 6"];
		state = {
			source: source
		};
	}
	
	override function render() {
		var onDragEnd = function (result: DropResult) {
			if (result.destination == null) {
				return;
			}
		
			var indexSource: Int = Std.int(result.source.index);
			var indexDestination: Int = Std.int(result.destination.index);
		
			var elem = state.source[indexSource];
			state.source.remove(elem);
			state.source.insert(indexDestination, elem);
		
			setState({ source: state.source });
		};

		var renderItem = function (item, source:Array<String>) {
			var index = source.indexOf(item);

			return jsx(
				<CustomDraggable draggableId={item} index={index}>
					<p>{item}</p>
				</CustomDraggable>
			);
		}
	
		return jsx(
			<DragDropContext onDragEnd={onDragEnd}>
				<CustomDroppable droppableId={props.id}>
					{state.source.map((item) -> renderItem(item, state.source))}
				</CustomDroppable>
			</DragDropContext>
		);
	}
}
