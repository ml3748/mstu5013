<mail-app>

	<button type="button" name="button" onclick={ toggleEditor }>COMPOSE</button>

	<div class="mail-list">
		<mail-item each={ emailList }></mail-item>
	</div>

	<mail-editor if={ creatingEmail }></mail-editor>

	<script>
		//console.log('This tag', this);
		var that = this;
		//that 在这里只是random variable name，可以改成任何名字

		this.creatingEmail = false;

		this.toggleEditor = function(event) {
		  this.creatingEmail = true;
		};

		this.closeEditor = function(event) {
			//console.log(this);
		  that.creatingEmail = false;
			//如果这里不用that，而用this，那么这个creatingEmail实质上是 childtag.creatingEmail = false; 因为是child tag在call这个function
			//所以这里的"this"的意义就是，"the tag which calls me"?
			//so when one tag's function, inside which there is "this", is called by another tag，这种情况就会发生？
			that.update(); //是不是如果要更改另外一个tag的某些状态或者数据，就必须要mandatory update?
		};





		this.aardvark = "I'm a party animal.";



		this.emailList = [{
			toEmail: "alpha@alpha.com",
			subject: "some subject",
			body: "I like turtles."
		},{
			toEmail: "alpha@alpha.com",
			subject: "some subject",
			body: "I like turtles."
		},{
			toEmail: "alpha@alpha.com",
			subject: "some subject",
			body: "I like turtles."
		}];

	</script>

	<style>
		:scope {
			display: block;
			border: 1px solid orange;
			padding: 10px;
			position: fixed;
			height: 100%;
			width: 100%;
		}
		.mail-list {
			margin-top: 15px;
		}
	</style>


</mail-app>
