import react.ReactDOM;
import react.ReactMacro.jsx;

import js.Browser;

import components.App;

class Main {
	public static function main() {
		ReactDOM.render(jsx('<App id="droppable"/>'), Browser.document.getElementById('root'));
	}
}