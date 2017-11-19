import React, { Component } from "react"
import Spot from "./Spot"
import Modal from "./Shared/Modal"
import Loader from "./Shared/Loader"
import { Socket } from "phoenix"

export class Board extends Component {
  constructor(props) {
    super(props);

    this.channel = null;

    this.state = {
      board: {
        '0': '',
        '1': '',
        '2': '',
        '3': '',
        '4': '',
        '5': '',
        '6': '',
        '7': '',
        '8': '',
      },

      playersTurn: true,
      showTurnWarning: false,
      loading: true,
      victory: null,
    };
  }

  componentWillMount() {
    window.fetch(`/api/games/${GAME_ID}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
    }).then(response => (
      response.json()
    )).then(json => (
      this.setState({ board: json.board, loading: false })
    ));
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
      this.setState({ board: payload.board, victory: payload.victory })
    })

    this.channel.push("get_marker", {})

    this.channel.on("get_marker", payload => {
      if (!this.marker) {
        this.marker = payload.marker

        //if (payload.marker === "X") {
          //this.setState({ playersTurn: false })
        //}
      }
    })
  }

  handleMove(index) {
    if (this.state.playersTurn) {
      this.setState({ board: { ...this.state.board, [index]: this.marker }}, () => {

        this.channel.push("move", { board: this.state.board, game_id: GAME_ID })
      });
    } else {
      this.setState({ showTurnWarning: true })
    }
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
    console.log('WON', this.state.victory);
    return (

      <div className="board container">
        <Modal hidden={!this.state.showTurnWarning} timeOut={5000}>
          It's not your turn!
        </Modal>

        {this.state.loading && <Loader />}
        {!this.state.loading && this.renderGrid()}
      </div>
    )
  }
}


export default Board
