import react.React;
import react.ReactComponent;
import react.ReactMacro.jsx;
import react.ReactDOM;
import js.Browser;

import react_beautiful_dnd.DragDropContext;
import react_beautiful_dnd.Droppable;
import react_beautiful_dnd.Draggable;
import react_beautiful_dnd.DraggableLocation;
import react_beautiful_dnd.DropResult;

import uuid.Uuid;

private typedef Props = {
  var itemSource: Array<String>;
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

    var renderItem = function (provided, snapshot, item) {
      return jsx(
        <div
          ref={provided.innerRef}
          {...provided.draggableProps}
          {...provided.dragHandleProps}
        >
          <p>{item}</p>
        </div>
      );
    }

    var renderDrag = function (item, source) {
      var index = 0;
      for (i in 0...source.length) {
        if (source[i] == item) {
          index = i;
          break;
        }
      }
      var id = Uuid.nanoId();
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
        >
          {source.map((item) -> renderDrag(item, source))}
        </div>
      );
    }

    var renderDragDropContext = function (source) {
      return jsx(
        <DragDropContext onDragEnd={onDragEnd}>
          <Droppable droppableId="droppable">
            {(provided, snapshot) -> renderList(provided, snapshot, source)}
          </Droppable>
        </DragDropContext>
      );
    }

    return jsx(
      <div>{state.source != null && (return renderDragDropContext(state.source));}</div>
    );
  }
}

class Main {
  public static function main() {
    ReactDOM.render(jsx('<App/>'), Browser.document.getElementById('root'));
  }
}