<child>
	<strong>child.tag</strong>
	<button type="button" onclick={ createEvent }>UNMOUNT</button>
	<button type="button" onclick={ showThisInConsole }>THIS Demonstration</button>

	<script>
		// console.log('child.tag', this.parent.x);
		var tag = this;

		this.on('jinsevent', function(event){
		  alert('I heard jinsevent');
		});

		this.createEvent = function(event) {
		  this.trigger('jinsevent'); //点击button以后就触发了createEvent function，which triggers jinsevent(this.on)
			this.unmount();
		};

		this.showThisInConsole = function(event){
		  console.log('A:', this);
			this.x = "Holiday";

			var aaa = {
				animal: "tiger",
				update: function() {
					alert(this.animal); //why the system knows "this" is "aaa"?
 				}
			};

			setTimeout(function(){
			  console.log('B:', this);
				this.update();
			}.bind(aaa), 500);

		};


	</script>

	<style>
	:scope {
		display: block;
		border-radius: 4px;
		padding: 10px;
		font-family: Helvetica;
		background-color: silver;
	}
	</style>
</child>
