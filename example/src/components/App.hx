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

	var getItemStyle = (isDragging:Bool, draggableStyle:Dynamic) -> {
		var style	= {
			"userSelect": "none",
			"padding": "5px",
			"margin": '0 0 5px 0',
			// changer la couleur de fond en cas de glisser-déposer
			"background": (isDragging ? "lightgreen" : "grey")
		};
		var res = Reflect.copy(style);
		for(f in Reflect.fields(draggableStyle)) {
			trace(f);
			Reflect.setField(res,f,Reflect.field(draggableStyle,f));
		}
		return res;
	};
	
	var getListStyle = (isDraggingOver:Bool) -> ({
		background: isDraggingOver ? "lightblue" : "lightgrey",
		padding: "5px",
		paddingBottom: isDraggingOver ? "70px" : "5px",
		width: 250
	});

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
	
		var renderItem = function (provided, snapshot, item) {
			return jsx(
				<div
					ref={provided.innerRef}
					{...provided.draggableProps}
					{...provided.dragHandleProps}
					style={getItemStyle(snapshot.isDragging, provided.draggableProps.style)}
				>
					<p>{item}</p>
				</div>
			);
		}
	
		var renderDrag = function (item, source:Array<String>) {
			var index = source.indexOf(item);

			return jsx(
				<Draggable key={item} draggableId={item} index={index}>
					{(provided, snapshot) -> renderItem(provided, snapshot, item)}
				</Draggable>
			);
		}
	
		var renderList = function (provided, snapshot, source) {
			return jsx(
				<div
				{...provided.droppableProps}
				ref={provided.innerRef}
				style={getListStyle(snapshot.isDraggingOver)}
				>
					{source.map((item) -> renderDrag(item, source))}
				</div>
			);
		}
		
		var renderDragDropContext = function (source) {
			return jsx(
				<DragDropContext onDragEnd={onDragEnd}>
					<Droppable key={props.id} droppableId={props.id}>
						{(provided, snapshot) -> renderList(provided, snapshot, source)}
					</Droppable>
				</DragDropContext>
			);
		}
		return jsx(
			<div>
				{state.source != null && (return renderDragDropContext(state.source));}
			</div>
		);
	}
}
