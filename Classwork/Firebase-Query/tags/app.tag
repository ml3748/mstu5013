<app>
	<h1>MSTU ZOO</h1>

	<!-- Animal CREATE -->
	<div>
		<input type="text" ref="animalName" placeholder="Enter animal">
		<!-- <input type="text" ref=""> -->
		<button type="button" onclick={ saveAnimals }>SAVE</button>
	</div>

	<!-- Animal QUERY -->
	<div>
		<input type="text" ref="animalQuery" placeholder="Enter query" onkeyup={ animalSearch }>
		<!-- onchange -->
		<button type="button">SEARCH</button>
	</div>


	<!-- Animal RESULTS -->
	<ul>
		<li hide={ animals.length }>No Animals</li>
		<animal each={ animal in animals }></animal>
	</ul>

	<script>
		var tag = this;
		var animalsRef = rootRef.child('animals');
		this.animals = [];



		saveAnimals(e) {
			var key = animalsRef.push().key;

			var animal = {
				typeOfAnimal: this.refs.animalName.value.toLowerCase(),
				id: key
			};

			animalsRef.child(key).set(animal);

		};

		animalSearch(e) {
			console.log(this.refs.animalQuery.value);
			animalsRef.orderByChild('typeOfAnimal').startAt(this.refs.animalQuery.value).once('value', function(snap){
				//on or once
				var data = snap.val(); // + > numberstring(是string不是真正的number) > zzz > a crazy unicode？？

				tag.animals = Object.values(data).sort(function(a,b){
					return a.typeOfAnimal > b.typeOfAnimal;
				}); //change an object into array automatically

				console.log(data);
				console.log(tag.animals);

				tag.update(); //without it, the array will not be printed

			});


		};

		/*****
			ref.orderByChild('path').MODIFIERS.on('value', ...);

			MODIFIERS:
			.equalTo(value)

			.startAt(value)
			.endAt(value)

			.limitToFirst(num)
			.limitToLast(num)

			CHALLENGES:
			0. Let's think of the data architecture of our zoo. What does an animal model represent?
				- Does each model represent one animal?
				- Does each model represent a type of animal?
				- How does this change the model and architecture?

			1. Change the animal model to have a variety of different datatype properties.
			2. Create an interface to query certain animals.
			3. Allow users to query and get in results, different animals.

			4. Only print 5 animals at a time.
			5. Have a next page, prev page button.
			6. When they push next page, paginate the results to the next 5 animals. And also in reverse.

			7. Think of one type of query that might be better optimized by changing your data architecture, rather than using a query.

		******/

	</script>

	<style>
		:scope {
			display: block;
			font-family: Helvetica;
			font-size: 1em;
		}
		h1 {
			border-bottom: 1px solid #DDD;
			padding-bottom: 0.5em;
		}
	</style>
</app>
