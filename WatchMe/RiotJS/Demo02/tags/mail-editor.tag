<mail-editor>
	<p>EDITOR</p>

	<div>
		<span>TO</span> <input type="text" ref="emailTo" value="">
	</div>
	<div>
		<span>SUBJECT</span> <input type="text" ref="emailSubject" value="">
	</div>

	<textarea name="name" ref="emailBody" rows="4" cols="40"></textarea>

	<button type="button" onclick={ sendMessage }>SEND</button>
	<button type="button" onclick={ parent.closeEditor }>CANCEL</button>
	<!-- the event closeEditor is in mail-app.tag -->

	<script>
		console.log(this);
		//this.aaa= "mail-editor.tag"

// 	this.closeEditor = function(event) {
// 	this.parent.creatingEmail = false;
// 	//this.parent.update();
// };
//第二种做法，把这个closeEditor的event从parent tag放到这里，把that换成this，
//然后去掉cancel button的parent字样；因为此时这个event不是属于parent tag的了

		this.sendMessage = function(event) {
			var newEmail = {
				toEmail: this.refs.emailTo.value,
				subject: this.refs.emailSubject.value,
				body: this.refs.emailBody.value
			};
			this.parent.emailList.push(newEmail);
			this.parent.update(); //Why it works if I comment out this line?
			this.parent.closeEditor();//call closeEditor function of parent
		};
	</script>

	<style>
		:scope {
			display: block;
			background-color: #333;
			color: white;
			border: 1px solid maroon;
			padding: 10px;
			position: fixed;
			right: 0;
			bottom: 0;
			width: 300px;
			height: 200px;
		}
		textarea {
			margin-top: 5px;
		}
	</style>
</mail-editor>
