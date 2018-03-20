<app>

	<h1>Welcome to MSTU Chat!</h1>

	<div class="chatLog" ref="chatLog">
		<!-- Messages go here: -->
		<message each={ msg in chatLog }></message>
	</div>

	<input type="text" ref="messageInput" onkeypress={ sendMsg } placeholder="Enter Message">
	<button type="button" onclick={ sendMsg }>SEND</button>

<!-- two elements have the same event, but with different event listeners -->

	<script>
		var that = this;

		// Demonstration Data
		this.chatLog = [
			{ message: "Hello" }, { message: "Hola" }, { message: "Konnichiwa" }
		]; //fake data

//Here - fetch data from the database

		sendMsg(e) {
			if (e.type == "keypress" && e.key !== "Enter") {
				e.preventUpdate = true; // Prevents riot from auto update. //Q1: why we need this?
				return false; // Short-circuits function (function exits here, does not continue.)
				console.log('keypress');//only excute if commenting out "return false"
			}
			//Q2: but if we delete onkeypress eventlistner, it won't update neither

			var msg = {
				message: this.refs.messageInput.value
			};
			this.chatLog.push(msg);

			// messageRef.child('/a').set(msg); manually add child tag, not possible for twitter
			messageRef.push.set(msg)

			this.clearInput(); //call clearInput function
		}

		//Q3: why do not use that.update?

		clearInput(e) {
			this.refs.messageInput.value = "";
			this.refs.messageInput.focus();
		}
	</script>

	<style>
		:scope {
			display: block;
			font-family: Helvetica;
			font-size: 1em;
		}
		.chatLog {
			border: 1px solid grey;
			padding: 1em;
			margin-bottom: 1em;
		}
		[ref="messageInput"], button {
			font-size: 1em;
			padding: 0.5em;
		}
		[ref="messageInput"] {
			width: 50%;
		}
	</style>
</app>
