import React, { Component } from "react"

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
    }
  }

  render() {
    return (
      <div className="board">
        Hello world!
      </div>
    )
  }
}


export default Board
