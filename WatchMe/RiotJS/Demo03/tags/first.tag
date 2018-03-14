<first>
	<strong>first.tag</strong>

	<button type="button" onclick={ increaseNumber }>Update Number</button>

	<pre>my number = { magicNumber }</pre>

	<second if={ magicNumber < 5 }></second>
	<!-- if={ magicNumber < 5 } if the magicnumber < 5, then show it; otherwise hide it-->

	<script>
		console.log('first.tag');

		this.magicNumber = 0;

		this.increaseNumber = function(event){
		  this.magicNumber++; //call back function? Function inside another function

			if (this.magicNumber > 5) {
				this.magicNumber = 0;
				//this will lead to the remounting of this tag
				//magicNumber > 5 -- magicNumber = 0 -- qualify if conditional -- show
			}
		};

		this.on('mount', function(event){
		  console.log('MOUNT first.tag');
		});

		this.on('update', function(event){
		  console.log('UPDATE first.tag');
		});

	</script>

	<style>
		:scope {
			display: block;
		}
	</style>
</first>
