import React from 'react';
import { describe, it } from 'mocha';
import { expect } from 'chai';
import { shallow } from 'enzyme';
import GameList from '../../../Components/Games/GameList';
import GameRow from '../../../Components/Games/GameRow';

describe('<GameList />', () => {
  const wrapper = shallow(<GameList />);

  const mockGames = {
    games: [
      { id: 1, board: {} },
    ],
  };

  it('should render a div', () => {
    expect(wrapper.find('div')).to.have.length(1);
  });

  describe('when state has a list of games', () => {
    wrapper.setState({ games: mockGames });

    it('should render at least one GameRow component', () => {
      expect(wrapper.find(GameRow)).length.to.be.above(0);
    });
  });
});

