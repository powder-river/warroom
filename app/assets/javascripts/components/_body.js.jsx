var Body = React.createClass({
  getInitialState(){
    return {players: []}
  },

  componentDidMount(){
    $.getJSON('api/v1/players.json', response => {this.setState({players: response})})
  },

  updatePlayers(position){
    $.ajax({
      url: `api/v1/filter.json`,
      method: "GET",
      data: position,
      success: (response) => {
        this.filterPlayers(response);
      }
    });
  },

  filterPlayers(players){
    this.setState({players: players})
  },


  render(){
    return(

      <div>
        <FilterMenu updatePlayers={ this.updatePlayers }/>
        <AllPlayers players={ this.state.players }  />
      </div>
    )
  }
});
