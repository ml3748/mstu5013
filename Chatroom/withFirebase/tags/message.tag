<message>

	<div>
		<span class="label delete" onclick={ deleteMsg } show={ msg.author == opts.user }>DELETE</span>
		<span class="label edit" onclick={ editMsg } show={ msg.author == opts.user && !editing }>EDIT</span>
		<span show={ msg.author !== opts.user }>
			<span class="label arrow up" onclick={ voteUp }>&uarr;</span>
			<span class="label arrow down" onclick={ voteDown }>&darr;</span>
		</span>
		<span class="label score">{ msg.score }</span>

		<span class="time">{ formattedTime } &mdash;</span> <strong>{ msg.author || "Anonymous" }:</strong> <span>{ censorMessage() }</span>
	</div>

	<!-- EDITOR -->
	<div class="editor" if={ editing }>
		<textarea rows="4" ref="msgTextarea">{ msg.message }</textarea>
		<button onclick={ save }>SAVE</button>
		<button onclick={ cancel }>CANCEL</button>
	</div>

	<script>
		var that = this;
		console.log('message tag', this);

		this.formattedTime = getFormattedTime();
		this.editing = false;

		// Tad different than other updateMsg function in app.tag
		function updateMsg(msg) {
			console.log('updateMsg a:', this); //window, because the function here is not this.xxx = function(event) {};
			console.log('updateMsg b:', that); //this message tag, because var that = this;
			var updates = {};
					updates['messages/' + that.msg.id] = msg;
					updates['messagesByUser/' + that.msg.author + '/' + that.msg.id] = msg;
			database.ref().update(updates); //lost argument?
		}

		editMsg(e) {
			this.editing = true;
		}

		save(e){
			this.msg.message = this.refs.msgTextarea.value;

			updateMsg(this.msg);

			this.editing = false;
		}

		cancel(e){
			this.editing = false;
		}

		deleteMsg(e) {
			updateMsg(null);
		}

		voteUp(e) {
			this.msg.votesUp++;
			this.updateVotes();

			updateMsg(this.msg);
		}

		voteDown(e) { //need to know how many downvotes；计算downvote的次数
			this.msg.votesDown++;
			this.updateVotes();

			updateMsg(this.msg);
		}

		updateVotes() {
			this.msg.score = this.msg.votesUp - this.msg.votesDown;
		}

		censorMessage() {
			var up = this.msg.votesUp;
			var down = this.msg.votesDown;
			var total = up + down;

			if (up + down <= 10) {
				return this.msg.message;
			} else if (this.msg.score >= 0) {
				return this.msg.message;
			} else {
				return "HIDDEN DUE TO DOWNVOTES";
			}
		}

		// https://stackoverflow.com/questions/847185/convert-a-unix-timestamp-to-time-in-javascript
		function getFormattedTime() {
			var timestamp = that.msg.createdAt;
			var date = new Date(timestamp);
			var hours = "0" + date.getHours();
			var minutes = "0" + date.getMinutes();
			var seconds = "0" + date.getSeconds();

			return `${hours.substr(-2)}:${minutes.substr(-2)}:${seconds.substr(-2)}`;
		}
	</script>

	<style>
		:scope {
			display: block;
			border: 1px solid dodgerblue;
			padding: 0.5em;
		}
		:scope:not(:last-child) {
			margin-bottom: 1em;
		}
		.time {
			font-family: monospace;
		}
		.label {
			font-size: 0.5em;
			padding: 0.25em 0.5em;
			border-radius: 0.25em;
			cursor: pointer;
			background-color: silver;
		}
		.delete:hover {
			background-color: red;
			color: white;
		}
		.arrow {
			background-color: dodgerblue;
			color: white;
		}
		.arrow.up:hover {
			background-color: green;
		}
		.arrow.down:hover {
			background-color: tomato;
		}
		.score {
			background-color: white;
			border: 1px solid #333;
			cursor: default;
		}
		textarea {
			display: block;
			width: 50%;
			margin: 1em 0;
		}
	</style>
</message>
