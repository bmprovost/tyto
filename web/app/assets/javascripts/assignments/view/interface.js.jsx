/** @jsx React.DOM */

(function () {
  window.QuestionForm = React.createClass({
    getInitialState: function() {
      return { answer: "", questionText: assignment.questionText, questionLevel: assignment.questionLevel, difficult: false, };
    },
    render: function() {
      return (
        <div className="question">
          Level: {this.state.questionLevel}<br></br>
          Current Question: {this.state.questionText}
          <form onSubmit={this.onSubmit}>
            <input onChange={this.onChange} value={this.state.answer} />
            <button>Submit</button>
          </form>
          <button onClick={this.onClick} id="difficult" className='easy'> Difficult </button>
        </div>
      );
    },
    onClick: function(e) {
      e.preventDefault;
      var button = document.getElementById("difficult")
      if(this.state.difficult===false){
        this.state.difficult = true;
        button.className = "hard"

      }
      else{
        this.state.difficult=false;
         button.className = "easy"

      }
    },
    onSubmit: function (e) {
      e.preventDefault();
      assignment_id = assignment.id;
      this.props.handleSubmit({answer: this.state.answer, assignment_id: assignment_id, difficult: this.state.difficult});
    },

    onChange: function(e) {
      this.setState({answer: e.target.value})
    }
  });

  window.Chart = React.createClass({
    getInitialState: function() {
      return { proficiencies: assignment.proficiencies};
    },
    render: function() {
      return (
        <div className="chart">
          A cool chart!
        </div>
      );
    }
  });

  window.Progress = React.createClass({
    getInitialState: function() {
      return { proficiency: assignment.proficiency};
    },
    render: function() {
      return (
        <div className="progress">
          Proficiency: {this.state.proficiency}<br></br>
        </div>
        // <div className="progress large-6 success round"><span class="meter" style="width: {this.state.proficiency}"></span></div>
      );
    }
  });

  window.Streaks = React.createClass({
    getInitialState: function() {
      return { currentStreak: assignment.currentStreak, longestStreak: assignment.longestStreak};
    },
    render: function() {
      return (
        <div className="streaks">
          Current Streak: {this.state.currentStreak} <br></br>
          Longest Streak: {this.state.longestStreak} <br></br>
        </div>
      );
    }
  });

})();


