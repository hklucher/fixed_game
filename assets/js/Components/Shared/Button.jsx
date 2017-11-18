import React from 'react';
import PropTypes from 'prop-types';

const Button = props => (
  <button className="btn btn-primary" onClick={props.onPress}>
    {props.children}
  </button>
);


Button.propTypes = {
  onPress: PropTypes.func.isRequired,
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node,
  ]).isRequired,
};

export default Button;
