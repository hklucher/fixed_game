import React from 'react';
import PropTypes from 'prop-types';
import Spot from './Spot';

const Board = (props) => {
  const spots = Object.keys(props.board)

  return (
    spots.map(spotNum => {
      return (
        <Spot
          index={spotNum}
          key={spotNum}
          onClick={props.handleMove}
          value={props.board[spotNum]}
        />
      )
    })
  )
}

Board.propTypes = {
  board: PropTypes.object.isRequired,
  handleMove: PropTypes.func.isRequired,
};

export default Board;