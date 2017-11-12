import React, { Component } from 'react';
import GameRow from './GameRow';

export default class GameList extends Component {
  constructor(props) {
    super(props);

    this.state = {
      games: [],
    };
  }

  render() {
    const  { games } = this.state;

    return (
      games.map((game) => {
        return <GameRow game={game} />;
      })
    );
  }
}
