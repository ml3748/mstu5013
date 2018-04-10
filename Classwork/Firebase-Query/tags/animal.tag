<animal>

	<span>{ animal.typeOfAnimal }</span>
	<!-- <span>{ animal.typeOfAnimal || animal.typeofAnimal || animal.typeofanimal}</span> -->
	<!-- the way you write "typeOfAnimal" matters, because this.animal = [
	typeOfAnimal: "tiger",
	id:
	]
  in the array, if different classmates wrote the property wrong or in dfferent way, then it will not be printed out.
-->

	<script>
		var tag = this;
		console.log('animal.tag');
	</script>

	<style>
		:scope {
			display: list-item;
		}
	</style>
</animal>
