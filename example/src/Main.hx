import react.React;
import react.ReactComponent;
import react.ReactMacro.jsx;
import react.ReactDOM;
import js.Browser;

import react_beautiful_dnd.DragDropContext;
import react_beautiful_dnd.Droppable;
import react_beautiful_dnd.Draggable;

private typedef OuterProps = {
}

class App extends ReactComponent {
  
  // Normally you would want to split things out into separate components.
  // But in this example everything is just done in one place for simplicity
  override function render()  {
    var source:Array<String> = ["TEST 1", "TEST 2", "TEST 3"];

    var onDragEnd = function (result) {
      trace(result);
      // dropped outside the list
      if (!result.destination) {
        return;
      }

      trace("index", source);
      var index = 0;
      var item = null;
      for (i in 0...source.length) {
        if(source[i] == item){
          index = i;
          item = result.source[i];
          break;
        }
      }
      trace("index", (result.destination.index ));
      var removedItem:Int = index; // Retire le trésor (élément 3) de l'index 2
      source.insert(0, item);
    };

    var renderItem = function(provided, snapshot, item){
      return jsx(
        <div
          ref={provided.innerRef}
          {...provided.draggableProps}
          {...provided.dragHandleProps}
        >
          <h1>{item}</h1>
        </div>
      );
    }

    var renderDrag = function(item, source){
      var index = 0;
      for (i in 0...source.length) {
        if(source[i] == item){
          index = i;
          break;
        }
      }
      return jsx(
        <Draggable draggableId={item} index={index}>
          {(provided, snapshot) -> renderItem(provided, snapshot, item)}
        </Draggable>
      );
    }

    var renderDrop = function(provided, snapshot, source){
      return jsx(
        <div
          {...provided.droppableProps}
          ref={provided.innerRef}
        >
          {source.map((item) -> renderDrag(item, source))}
        </div>
      );
    }

    return 
      jsx(
        <div>
          <h1>TEST</h1>
          <DragDropContext onDragEnd={onDragEnd}>
            <Droppable droppableId="droppable">
              {(provided, snapshot) -> renderDrop(provided, snapshot, source)}
            </Droppable>
          </DragDropContext>
        </div>
      );
  }
}

class Main
{
	public static function main()
	{
		ReactDOM.render(jsx('<App/>'), Browser.document.getElementById('root'));
	}
}