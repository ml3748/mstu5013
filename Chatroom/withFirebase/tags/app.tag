<app>

	<h1>Welcome <span class="username">{ user || "Anonymous" }</span>.</h1>

	<!-- USERNAME INPUT -->
	<div if={!user}>
		<input type="text" placeholder="Enter a username" ref="username" onkeypress={ enterChat }>
		<button type="button" onclick={ enterChat } show={ !user }>ENTER</button>
	</div>

	<!-- Higher controls -->
	<div if={ user }>
		<button onclick={ showMine } show={ mode == "general" }>My Messages</button>
		<button onclick={ showGeneral } show={ mode == "user-page"}>BACK</button>
		<button onclick={ leaveChat }>LEAVE CHAT</button><br><br>
	</div>

	<!-- CHATROOM -->
	<div if={user && (mode == "general")}>

		<div class="chatLog" ref="chatLog">
			<!-- Messages go here: -->
			<message each={ msg in chatLog } user= { user }></message>
		</div>

		<input type="text" ref="messageInput" onkeypress={ sendMsg } placeholder="Enter Message">
		<button type="button" onclick={ sendMsg }>SEND</button>
	</div>

	<!-- Since this is an IF, it will mount or unmount based on condition -->
	<user-page if={user && (mode == "user-page")} user={ user }></user-page>


	<script>
		var that = this;
		this.user = null;
		this.mode = "general";

		this.chatLog = [];

		messagesRef.on('value', function(snapshot){
		  var messagesData = snapshot.val();

			that.chatLog = [];
			for (key in messagesData) {
				that.chatLog.push(messagesData[key]);
			}

			that.update();
		});

		sendMsg(e) {
			if (e.type == "keypress" && e.key !== "Enter") {
				e.preventUpdate = true; // Prevents riot from auto update.
				return false; // Short-circuits function (function exits here, does not continue.)
			}

			var uniqueID = messagesRef.push().key; //每个user的ID
			console.log(uniqueID);
			var msg = {
				author: this.user,
				message: this.refs.messageInput.value,
				createdAt: firebase.database.ServerValue.TIMESTAMP,
				id: uniqueID,
				votesUp: 0,
				votesDown: 0,
				score: 0
			};

			updateMsg(msg); // See function below

			this.clearInput();
		}

		// Update function
		function updateMsg(msg) {
			var updates = {};

					updates['messages/' + msg.id] = msg; //x = {}; x["b"] = 2; {b:2}
					updates['messagesByUser/' + that.user + '/' + msg.id] = msg; //messagesByUser - child that.user(username) - child msg.id(uniqueID)

			console.log(updates); // See console.log(), what are the properties of this object? What do these properties represent?

			// Explain how `.update()` works.
			database.ref().update(updates);
		}

		clearInput(e) {
			this.refs.messageInput.value = "";
			this.refs.messageInput.focus();
		}

		// Change page "mode" from general chatroom to my message history
		showMine(e) {
			this.mode = "user-page";
		}
		showGeneral(e) {
			this.mode = "general";
		}

		// Our FAKE login, logout - Note - anyone can pose as anyone here.
		enterChat(e) {
			if (e.type == "keypress" && e.key !== "Enter") {
				e.preventUpdate = true;
				return false;
			}

			var username = this.refs.username.value;
			if (username) {
				this.user = this.refs.username.value;
			} else {
				return;
			}
		}

		leaveChat(e) {
			this.user = null;
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
		input[type="text"], button {
			font-size: 1em;
			padding: 0.5em;
		}
		input[type="text"] {
			width: 50%;
		}
		button {
			cursor: pointer;
		}
		.username {
			text-decoration: underline;
			color: salmon;
		}
	</style>
</app>
