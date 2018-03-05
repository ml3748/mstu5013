<mail-item>
	<p>ITEM</p>
	<span>{ subject }</span> | <span>{ toEmail }</span> | <span>{ body }</span>
	<!-- <span> element can be used to group inline-elements; color a particular part -->

	<script>
		console.log(this);
	</script>

	<style>
		:scope {
			display: block;
			border: 1px solid teal;
			padding: 10px;
		}
	</style>
</mail-item>
