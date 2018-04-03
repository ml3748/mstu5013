<app>

	<h1>Welcome to MSTU Chat! [without Firebase / just Riot]</h1>
	<a href="../withFirebase">See Firebase Version</a><br><br>

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
			{ message: "LOADING DATA" }
		]; //fake data

//Here - fetch data from the database
//In here, I'll set chatLog to the db data

		messagesRef.on('value', function(snapshot) {
			var data = snapshot.val();

			that.chatLog = [];//如果没有这行，所有东西都会redundant

			for (key in data) {
				that.chatLog.push(data[key]);
			}

			that.update();
		});

		sendMsg(e) {
			if (e.type == "keypress" && e.key !== "Enter") {
				e.preventUpdate = true; // Prevents riot from auto update.
				return false; // Short-circuits function (function exits here, does not continue.)
				console.log('keypress');//only excute if commenting out "return false"
			}
			//Q2: but if we delete onkeypress eventlistner, it won't update neither
			if (this.refs.messageInput.value !== "") {

				var msg = {
					message: this.refs.messageInput.value
				}

				messagesRef.push(msg); //if you use "set", then it replaces everything in the database
				// messagesRef.child('/a').set(msg); manually add child tag, not possible for twitter


			}

			//原来没有database的时候，通过这个codes来sendMsg
			// var msg = {
			// 	message: this.refs.messageInput.value
			// };
			// this.chatLog.push(msg);


			this.clearInput(); //call clearInput function
		}

		this.on('update', function() {
			console.log('update was called');
		});

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
