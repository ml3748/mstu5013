<question>

	<p>{ quizItem.question }</p>
	<label each={ choice in quizItem.choices }>
		<input type="radio" name={ quizItem.id } value={ quizItem.answer } onclick={ setAnswer }></input> { choice }
	</label>

  <!-- <h3>{ choices[0] }</h3>
	<h3>{ choices[1] }</h3>
	<h3>{ choices[2] }</h3> -->
	<!-- 但是这个方法不够便捷，如果数据很多的话 -->



	<script>
		var that = this;
		console.log('question.tag');
		console.log(this);

		setAnswer(e) {
			this.userAnswer = e.item.choice;
			console.log(userAnswer);
		};

		this.animal = "tiger";

			console.log(this.userAnswer);
			if (this.userAnswer == this.quizItem.answer) {
				this.quizItem.isCorrect = true;
			} else {
				this.quizItem.isCorrect = false;
			}
		}

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
