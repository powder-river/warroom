var AllPlayers = React.createClass({
  handleFilter(){
    $.ajax({
      url: `api/v1/filter.json`,
      type: "GET",
      success: () => {
        this.setState({players: response});
      }
    });
  },


  render(){
    var players = this.props.players.map((player) => {
      return(
        <tr key={ player.id }>
          <td>{ player.position }</td>
          <td>{ player.firstName } { player.lastName }</td>
          <td>{ player.salary }</td>
          <td>{ player.fppg }</td>
          <td>{ player.played }</td>
          <td>{ player.game }</td>
          <td>{ player.injury }</td>
          <td>{ player.injuryDetails }</td>
        </tr>
      )
    });

    return(
      <div>
      <button onClick={ this.handleFilter }>Push</button>
        <table>
          <thead>
            <tr>
              <th> Position </th>
              <th> Name </th>
              <th> Salary </th>
              <th> FPPG </th>
              <th> Played </th>
              <th> Game </th>
              <th> Injury </th>
              <th> Inj. Details </th>
            </tr>
          </thead>
          <tbody>
            { players }
          </tbody>
        </table>
      </div>
    )
  }
});
