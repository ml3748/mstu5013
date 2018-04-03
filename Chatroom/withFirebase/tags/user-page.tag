<user-page>

	<h2>My Message History</h2>

	<message each={ msg in myMessages } user={ user }></message>
	<div hide={ myMessages.length }>
		You have no message history.
	</div>

	<script>
		var that = this;
		var myMessages = [];

		this.user = this.opts.user;

		var myMessagesRef = database.ref('messagesByUser/' + this.user);

		myMessagesRef.on('value', function(snapshot){
			var messagesData = snapshot.val();

			that.myMessages = [];

			for (key in messagesData) {
				that.myMessages.push(messagesData[key]);
			}

			that.update();
		});

		this.on('unmount', function(){
		  myMessagesRef.off();
		});

	</script>

	<style>
		:scope {
			display: block;
		}
	</style>
</user-page>
