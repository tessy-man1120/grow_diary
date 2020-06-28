var editor = new EasyMDE({
	autofocus: true,
	autosave: {
		enabled: true,
		uniqueId: "MyUniqueID",
		delay: 1000,
		submit_delay: 5000,
		timeFormat: {
			locale: 'ja',
			format: {
				year: 'numeric',
				month: 'long',
				day: '2-digit',
				hour: '2-digit',
				minute: '2-digit',
			},
		},
		text: "Autosaved: "
	},
	blockStyles: {
		bold: "__",
		italic: "_",
	},
	element: document.getElementById("MyID"),
	forceSync: true,
	hideIcons: ["guide", "heading"],
	indentWithTabs: false,
	initialValue: "Hello world!",
	insertTexts: {
		horizontalRule: ["", "\n\n-----\n\n"],
		image: ["![](http://", ")"],
		link: ["[", "](http://)"],
		table: ["", "\n\n| Column 1 | Column 2 | Column 3 |\n| -------- | -------- | -------- |\n| Text     | Text      | Text     |\n\n"],
	},
	lineWrapping: false,
	minHeight: "500px",
	parsingConfig: {
		allowAtxHeaderWithoutSpace: true,
		strikethrough: false,
		underscoresBreakWords: true,
	},
	placeholder: "Type here...",

	previewClass: "my-custom-styling",
	previewClass: ["my-custom-styling", "more-custom-styling"],

	previewRender: function(plainText) {
		return customMarkdownParser(plainText); // Returns HTML from a custom parser
	},
	previewRender: function(plainText, preview) { // Async method
		setTimeout(function(){
			preview.innerHTML = customMarkdownParser(plainText);
		}, 250);

		return "Loading...";
	},
	promptURLs: true,
	promptTexts: {
		image: "Custom prompt for URL:",
		link: "Custom prompt for URL:",
	},
	renderingConfig: {
		singleLineBreaks: false,
		codeSyntaxHighlighting: true,
		sanitizerFunction: function(renderedHTML) {
			// Using DOMPurify and only allowing <b> tags
			return DOMPurify.sanitize(renderedHTML, {ALLOWED_TAGS: ['b']})
		},
	},
	shortcuts: {
		drawTable: "Cmd-Alt-T"
	},
	showIcons: ["code", "table"],
	spellChecker: false,
	status: false,
	status: ["autosave", "lines", "words", "cursor"], // Optional usage
	status: ["autosave", "lines", "words", "cursor", {
		className: "keystrokes",
		defaultValue: function(el) {
			this.keystrokes = 0;
			el.innerHTML = "0 Keystrokes";
		},
		onUpdate: function(el) {
			el.innerHTML = ++this.keystrokes + " Keystrokes";
		},
	}], // Another optional usage, with a custom status bar item that counts keystrokes
	styleSelectedText: false,
	sideBySideFullscreen: false,
	syncSideBySidePreviewScroll: false,
	tabSize: 4,
	toolbar: false,
	toolbarTips: false,
});
