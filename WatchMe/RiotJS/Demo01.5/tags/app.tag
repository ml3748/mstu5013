<app>
	<h1>APP TAG</h1>
	<button type="button" onclick={ toggleStateA }>Button A</button>
	<input type="text" value="" placeholder="Text B" onchange={ stateB } ref="textB">
	<div>
		<textarea rows="4" placeholder="Textarea C" onkeyup={ updateStateC }></textarea>
		<!--第一步：Jin在这里设置了一个onkeyup的event-->
	</div>
	<div>
		<label>
			English
			<input type="radio" name="language" value="eng" onclick={ updateStateD } checked>
		</label>
		<label>
			Spanish
			<input type="radio" name="language" value="spa" onclick={ updateStateD }>
		</label>
		<label>
			Japanese
			<input type="radio" name="language" value="jpn" onclick={ updateStateD }>
		</label>
	</div>
	<div>
		<select onchange={ updateStateE }>
			<option value="">-----</option>
			<option value="car">Car</option>
			<option value="bicycle">Bicycle</option>
		</select>
	</div>
	<div onchange={ updateStateFPets }>
		<label each={val, key in stateFPets}>
			{ key }
			<input type="checkbox" value={ key } checked={ val }>
		</label>
		<!-- <label>
			Alpaca
			<input type="checkbox" value="alpaca">
		</label>
		<label>
			Cat
			<input type="checkbox" value="cat">
		</label>
		<label>
			Parrot
			<input type="checkbox" value="parrotx">
		</label> -->
	</div>

<pre>
this.stateA = { stateA ? "Cat" : "Dog" };
this.stateB = { stateB };
this.stateC = { stateC || "no text" }; <!--第三步。Jin想让这个stateC在网页上显示“no text”
	由于在JS部分，stateC被设置为空集，所以它的值被系统认为是false，这里||的意思是 OR-->
this.stateD = { stateD.toUpperCase() };
this.stateE = { stateE };
this.stateF = alpaca > { stateFPets.alpaca ? "yes" : "no"}
              cat    > { stateFPets.cat ? "yes" : "no"}
              parrot > { stateFPets.parrot ? "yes" : "no"}
</pre>


	<script>
		this.testX = function(event){
		  alert('changed');
		}

		console.log('THIS TAG', this);

		this.stateA = false;
		this.stateB = "default text";
		this.stateC = ""; //第二步：对应upStateC，这里初始值为空集，在网页上没有显示
		this.stateD = "eng";
		this.stateE = "none selected";

		this.stateFPets = {
			dog: false,
			cat: false,
			parrot: false,
			dragon: false,
			fish: true
		}; //电脑咋知道这是上面input的value啊？？？

		this.toggleStateA = function(event){
			this.stateA = !this.stateA;
		};

		stateB(event){
			console.log(event.target.value);
			this.stateB = this.refs.textB.value;
		};

		this.updateStateC = function(event){
		  this.stateC = event.target.value;
		};

		this.updateStateD = function(event){
			console.log(event);
			this.stateD = event.target.value;
		};

		this.updateStateE = function(event){
		  this.stateE = event.target.value;
		};

		this.updateStateFPets = function(event){
		  var petType = event.target.value; //petType的值是 alpaca，cat，parrot; only return the value of the current checkbox which triggered the event
			console.log(petType);
		  console.log(event);
//click on one checkbox and then check out the event，发现在target里面有一个“checked: true”
			var isChecked = event.target.checked;
			this.stateFPets[petType] = isChecked;
//this.stateFPets[petType]就相当于 this.stateFPets.alpaca/cat/parrot
		};

	</script>

	<style>
		:scope {
			font-family: Helvetica;
		}
		pre {
			border: 1px solid #333;
			padding: 10px;
			border-radius: 4px;
			background-color: #F5F5F5;
		}
	</style>
</app>
