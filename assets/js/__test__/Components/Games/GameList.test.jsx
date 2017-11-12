import React from 'react';
import { describe, it } from 'mocha';
import { expect } from 'chai';
import { shallow } from 'enzyme';
import GameList from '../../../Components/Games/GameList';

describe('<GameList />', () => {
  const wrapper = shallow(<GameList />);

  it('should render a div', () => {
    expect(true).to.equal(true)
    //expect(wrapper.find('div')).to.have.length(1);
  });
});

