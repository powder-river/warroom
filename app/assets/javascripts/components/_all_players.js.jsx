var AllPlayers = React.createClass({
  render(){
    var players = this.props.players.map((player) => {
      return(
        <tr key={ player.id }>
          <td>{ player.position }</td>
          <td>{ player.name }</td>
          <td>{ player.salary }</td>
          <td>{ player.fppg }</td>
          <td>{ player.gamesPlayed }</td>
          <td>{ player.game }</td>
          <td>{ player.injury }</td>
          <td>{ player.injuryDetails }</td>
        </tr>
      )
    });

    return(
      <div>

      {/* <button onClick={ this.handleUpdate }>Push</button> */}
        <table className="tables">
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
