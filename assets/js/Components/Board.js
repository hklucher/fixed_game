import React, { Component } from "react";
import Spot from "./Spot";
import { Socket } from "phoenix"

export class Board extends Component {
  constructor(props) {
    super(props);

    this.channel = null;

    this.state = {
      board: {
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
    };
  }

  componentDidMount() {
    let socket = new Socket("/socket", {params: {token: window.userToken}})

    socket.connect()

    this.channel = socket.channel("game", {user_id: USER_ID})
    // TODO: Handle failed connections in state.
    this.channel.join()
      .receive("ok", resp => { console.log("Joined!", resp) })
      .receive("error", resp => { console.log("Unable to join", resp) })

    this.channel.on("move", payload => {
      this.setState({ board: payload.board })
    })

    this.channel.push("get_marker", {})

    this.channel.on("get_marker", payload => {
      console.log('MARKER', payload)
    })
  }

  handleMove(index) {
    this.setState({ board: { ...this.state.board, [index]: "X" }}, () => {
      this.channel.push("move", this.state)
    });
  }

  renderGrid() {
    const spots = Object.keys(this.state.board);
    return (
      spots.map(spotNum => {
        return (
          <Spot
            index={spotNum}
            key={spotNum}
            onClick={this.handleMove.bind(this)}
            value={this.state.board[spotNum]} 
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
