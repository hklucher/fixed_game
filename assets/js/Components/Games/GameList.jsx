import React, { Component } from 'react';
import GameRow from './GameRow';
import Error from '../Shared/Error'

export default class GameList extends Component {
  constructor(props) {
    super(props);

    this.state = {
      games: [],
      error: false,
    };
  }

  componentWillMount() {
    window.fetch('/api/games')
      .then(response =>
        response.json()).then((json) => {
        this.setState({ games: json.games });
      }).catch(() => this.setState({ error: true }));
  }

  render() {
    const { games } = this.state;

    return (
      <div className="container">
        <h2>Available Games</h2>
        <Error visible={this.state.error} message="Something terrible has happened." />
        {games.map(game => <GameRow key={game.id} game={game} />)}
      </div>
    );
  }
}
