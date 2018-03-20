<navbar>
	<strong>navbar.tag</strong>
	<span>Hello { opts.userfirst } { user.last }!</span>

	<script>
		console.log('navbar.tag', this);
		this.user = {
			first: "Anonymous",
			last: ""
		}; //default value

		this.on('update', function(event){
		  this.user.first = this.opts.userfirst || "Anonymous"; //if user.first doesn't exist, print "Anonymous"
			this.user.last = this.opts.userlast || "";
		});
		//whenever the page updates, call this function

	</script>

	<style>
		:scope {
			display: block;
		}
	</style>
</navbar>
