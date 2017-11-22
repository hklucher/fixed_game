import React, { Component } from "react"
import Spot from "./Spot"
import Modal from "./Shared/Modal"
import Loader from "./Shared/Loader"
import MoveTracker from './MoveTracker';
import { Socket } from "phoenix"
import { gameIsOver } from "../helpers/gameHelpers";
import FinishedGame from './FinishedGame';
import Board from './Board';

export class Game extends Component {
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
      loading: true,
      victory: false,
      gameIsOver: false,
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
    )).then((json) => {
      if (gameIsOver(json.board)) {
        this.setState({ gameIsOver: true })
      }

      this.setState({ board: json.board, loading: false })
    });
  }

  componentDidMount() {
    let socket = new Socket("/socket", {params: {token: window.userToken}})

    socket.connect()

    this.channel = socket.channel("game", { user_id: USER_ID })

    this.channel.join()
      .receive("ok", resp => { console.log("Joined!", resp) })
      .receive("error", resp => { console.log("Unable to join", resp) })

    this.channel.on("move", payload => {
      this.setState({ board: payload.board, victory: payload.victory, playersTurn: !this.state.playersTurn })
    })

    this.channel.push("get_marker", {})

    this.channel.on("get_marker", payload => {
      if (!this.marker) {
        this.marker = payload.marker

        if (payload.marker === "X") {
          this.setState({ playersTurn: false })
        }
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

  gameIsOver() {
    return this.state.gameIsOver || this.state.victory;
  }

  render() {
    return (
      <div className="board container">
        <Modal hidden={!this.state.showTurnWarning} timeOut={5000}>
          It's not your turn!
        </Modal>

        {this.gameIsOver()  && <FinishedGame />}
        <MoveTracker board={this.state.board} playersTurn={this.state.playersTurn} />

        {this.state.loading && <Loader />}
        {!this.state.loading && <Board board={this.state.board} handleMove={this.handleMove.bind(this)} />}
      </div>
    )
  }
}


export default Game;
