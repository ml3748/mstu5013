<question>

	<p> { quizItem.question }</p>
	<label each={ choice in quizItem.choices }>
		<input type="radio" name={ quizItem.id } value={ quizItem.answer } onclick={ setAnswer }></input> { choice }
	</label>

	<button type="button" onclick={ tellMeEItem }>e.item</button>


	<script>
		var that = this;
		console.log('question.tag');
		console.log(this);

		setAnswer(e) {
			this.userAnswer = e.item.choice;
			console.log('e.item: ', e.item);
			console.log('this.userAnswer: ', this.userAnswer);
			if (this.userAnswer == this.quizItem.answer) {
				this.quizItem.isCorrect = true;
			} else {
				this.quizItem.isCorrect = false;
			}
		}

		tellMeEItem(e){
			console.log(e.item);
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
