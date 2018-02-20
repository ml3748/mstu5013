<question>

	<p>{ quizItem.question }</p>
<<<<<<< HEAD
	<label each={ choice in quizItem.choices}>
		<input type="radio" name={quizItem.id} onclick={setAnswer}></input>{ choice }
		<!--为啥加了一个name就行了， "1"为啥也行-->
	</label>

  <!-- <h3>{ choices[0] }</h3>
	<h3>{ choices[1] }</h3>
	<h3>{ choices[2] }</h3> -->
	<!-- 但是这个方法不够便捷，如果数据很多的话 -->

=======
	<label each={ choice in quizItem.choices }>
		<input type="radio" name={ quizItem.id } value={ quizItem.answer } onclick={ setAnswer }></input> { choice }
	</label>

>>>>>>> upstream/master

	<script>
		var that = this;
		console.log('question.tag');
		console.log(this);

		setAnswer(e) {
			this.userAnswer = e.item.choice;
<<<<<<< HEAD
			console.log(userAnswer);
		};

		this.animal = "tiger";
=======
			console.log(this.userAnswer);
			if (this.userAnswer == this.quizItem.answer) {
				this.quizItem.isCorrect = true;
			} else {
				this.quizItem.isCorrect = false;
			}
		}
>>>>>>> upstream/master
	</script>

	<style>
		:scope {
			display: block;
		}
		label {
			display: block;
		}
	</style>
</question>
