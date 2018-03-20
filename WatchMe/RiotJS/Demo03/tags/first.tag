<first>
	<strong>first.tag</strong>

	<button type="button" onclick={ increaseNumber }>Update Number</button>

	<pre>my number = { magicNumber }</pre>

	<second if={ magicNumber < 5 }></second>
	<!-- if={ magicNumber < 5 } if the magicnumber < 5, then show it; otherwise hide it-->

	<script>
		var that = this;

		console.log('first.tag');

		this.magicNumber = 0;

		this.increaseNumber = function(event){
			event.preventUpdate = true; //prevent default update, but setTimeout is not a default update, it is a manual update
		  this.magicNumber++;

			if (this.magicNumber > 5) {
				this.magicNumber = 0;
				//this will lead to the remounting of this tag
				//magicNumber > 5 -- magicNumber = 0 -- qualify if conditional -- show
			}

			setTimeout(function(){
				alert('timeout');
				that.magicNumber = 100;
				that.update();
			}, 2000); //

			console.log(this);
		};

		this.on('mount', function(event){
		  console.log('MOUNT first.tag');
		});

		this.on('update', function(event){
		  console.log('UPDATE first.tag');
		});
//Riot internal event: lifecycle event, not user event.
//user event (click, scroll, load..) will automatically be updated/called by Riot
	</script>

	<style>
		:scope {
			display: block;
		}
	</style>
</first>
