import React, { Component } from 'react';
import './style.css';

class Calculator extends Component {

  // sets initial state of calculator with empty input fields
  constructor() {
    super();
    this.state = {
      input: "",
      inputFields: [{ input: "" }], // keep track of amount of fields there are
      sum: ""
    };
  }

  // grabs all elements by class name and caculates sum total, and sets state to render new sum
  handleSum = (event) => {
    event.preventDefault()

    let values = document.getElementsByClassName("inputValues");
    const arrSum = values => values.reduce((a,b) => a + b, 0)

    this.setState({
      sum: arrSum
  })
};

  // lets user input show up in fields
  handleChange = (event) => {
    this.setState({
      input: event.target.value,
    })
  }

// adds (concat) an input field to inputField array to be rendered
  handleAddInputField = () => {
    this.setState({
      inputFields: this.state.inputFields.concat([{ input: "" }])
    });
  };

// What will be rendered on webpage
  render() {
    return (
      <form onSubmit={this.handleSum}>
        <h4>Calulate Sums</h4>
        {this.state.inputFields.map((input, idx) => (
          <div>
            <input
              type="number"
              placeholder={`Input #${idx + 1} Value`}
              value={input}
              id = {idx}
              className="inputValues"
              onChange={this.handleChange}
            />
          </div>
        ))}

        <button
          type="button"
          onClick={this.handleAddInputField}
          className="small"
        >
          Add Input Field
        </button>

        <button>Calculate</button>
        {this.state.sum}
      </form>
    );
  }
}
export default Calculator
