import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { calculateNumberOfMoves, calculateTotalPossibleMoves } from '../helpers/gameHelpers';

export default class MoveTracker extends Component {
  renderPlayersTurn() {
    if (this.props.playersTurn) {
      return (
        <p className="players-turn">
          It's your turn
        </p>
      )
    } else {
      return (
        <p>
          It's your opponent's turn
        </p>
      )
    }
  }

  render() {
    const numberOfMovesMade = calculateNumberOfMoves(this.props.board);
    const numberOfPossibleMoves = calculateTotalPossibleMoves(this.props.board);

    return (
      <div className="move-tracker">
        <p>
          {`Move ${numberOfMovesMade}/${numberOfPossibleMoves}`}
        </p>

        {this.renderPlayersTurn()}
      </div>
    )
  }
}

MoveTracker.propTypes = {
  board: PropTypes.object.isRequired,
  playersTurn: PropTypes.bool.isRequired,
};