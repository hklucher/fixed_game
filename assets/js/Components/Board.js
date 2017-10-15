import React, { Component } from "react";
import Spot from "./Spot";

export class Board extends Component {
  constructor(props) {
    super(props);

    this.state = {
      "0": "",
      "1": "",
      "2": "",
      "3": "",
      "4": "",
      "5": "",
      "6": "",
      "7": "",
      "8": ""
    };
  }

  handleMove(index) {
    this.setState({ [index]: "X" });
  }

  renderGrid() {
    const spots = Object.keys(this.state);
    return (
      spots.map(spotNum => {
        return (
          <Spot
            index={spotNum}
            key={spotNum}
            onClick={this.handleMove.bind(this)}
            value={this.state[spotNum]} 
          /> 
        )
      })
    )
  }

  render() {
    return (
      <div className="board container">
        {this.renderGrid()}
      </div>
    )
  }
}


export default Board
