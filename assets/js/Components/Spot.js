import React from "react";
import PropTypes from "prop-types";

export const Spot = (props) => {
  return (
    <div className={`col-sm-4 spot ${props.disabled ? 'disabled' : ''}`} onClick={() => {props.onClick(props.index)}}>
      {props.value}
    </div>
  )
}

Spot.propTypes = {
  disabled: PropTypes.bool,
  index: PropTypes.string.isRequired,
  onClick: PropTypes.func.isRequired,
  value: PropTypes.oneOf(["X", "O", ""]).isRequired,
};

Spot.defaultProps = {
  disabled: false,
};

export default Spot
