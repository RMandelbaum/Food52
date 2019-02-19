import React, { Component } from 'react';
import Calculator from './Calculator.js'

class App extends Component {
  render() {
    return (
      <div className="App">
        <h1>Calculate Sums! </h1>
        <img src="https://png.pngtree.com/element_origin_min_pic/17/09/04/c1b08e0fb35750ba2cc96384c5af7ecf.jpg" className="App-logo" alt="logo" />
        <Calculator />
      </div>
    );
  }
}

export default App;
