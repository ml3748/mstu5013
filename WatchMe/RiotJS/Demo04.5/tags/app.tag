<app>
	<strong>app.tag</strong>
	<em>{ user.first }'s page</em>

	<navbar userfirst={ user.first } userlast={ user.last }></navbar>
	<profile userdata={ user }></profile>
	<!-- two ways passing the data into child tag -->

	<script>
		console.log('app.tag');
		this.user =
			{
				first: "AAA",
				last: "aaa"
			}; //default value

			//如果想有几个users，那么这个和下面function当中的user数据改成array
			//HTML部分改成 each={ item in user }; 然后在child tags当中改成 item.first; item.last就行了
			// {
			// 	first: "BBB",
			// 	last: "bbb"
			// }


		this.getUserFromDB = function(event) {
		  setTimeout(function(){

				this.user =
					{
						first: "Jin",
						last: "Kuwata"
				  };
					// {
					// 	first: "Amy",
					// 	last: "House"
					// }

				console.log('data received');
				this.update();

		  }.bind(this), 1500);

			console.log('getUserFromDB was called()');
		};


		this.getUserFromDB(); //because HTML in this tag does not have event listener? call when the page loads?


		//sequence: all tags have initialized value
		//app tag - the parent tag- updates through function getUserFromDB userfirst
		//since app tag changes, and we want child tags also changes and get the user data inside getUserFromDB function
		//we passes the data to child tag by adding properties to child components in the parent tag
		//add this.on in child tags (sensing updates)
		//app tag updates - because there is an update of data in the parent tag, which has passed to and shared by the child tags
		//the child tag also updates (senses the updates)

	</script>

	<style>
		:scope {
			display: block;
		}
	</style>
</app>
