import React from 'react';
import PropTypes from 'prop-types';

const GameRow = props =>
  (
    <div className="row list-item">
      <div className="col-sm-4">
        {props.game.title}
      </div>

      <div className="col-sm-4">
        Last active!
      </div>
    </div>
  );


GameRow.propTypes = {
  game: PropTypes.shape({
    id: PropTypes.number.isRequired,
    title: PropTypes.string.isRequired,
  }).isRequired,
};

export default GameRow;
