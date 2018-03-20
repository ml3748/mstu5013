<second>
	<strong>second.tag</strong>

	<button type="button" onclick={ unmountSecond }>Unmount Second</button>

	<button type="button" onclick={ getDataFromDatabase }>Get DATA</button>

	<pre>data = { username }</pre>

	<script>
		var that = this;

		console.log('second.tag');

		this.username = "no name";

		this.getDataFromDatabase = function(event) {
		 event.preventUpdate = true;

			var data = "xyz"; //why it cannot be defined in setTimeout?

			setTimeout(function(){
				that.username = "jmk2142";
				that.update();
			}, 1000);

		};

		this.on('update', function(event){
		  console.log('this.username', this.username);
		}); //to check if the setTimeout updates fine



		// this.unmountSecond = function(event) {
		//   this.unmount();
		// };

		// this.on('mount', function(event){
		//   console.log('MOUNT second.tag');
		// });
		//
		// this.on('unmount', function(event){
		//   console.log('UNMOUNT second.tag');
		// }); 如果unmount second tag 就console.log这句话。unmount的动作是通过if和increaseNumber function触发的
	</script>

	<style>
		:scope {
			display: block;
		}
	</style>
</second>
