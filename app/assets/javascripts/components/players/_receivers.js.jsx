var Recievers = React.createClass({
  render(){
    var players = this.props.players.map((player) => {
      return(
        <tr key={ player.id }>
          <td>{ player.position }</td>
          <td>{ player.name }</td>
          <td>{ player.salary }</td>
          <td>{ player.fppg }</td>
          <td>{ player.game }</td>
          <td>{ player.targetsPerGame }</td>
          <td>{ player.catchPerGame }</td>
          <td>{ player.receiveYardsPerGame }</td>
          <td>{ player.yardsPerCatch }</td>
          <td>{ player.touchdowns }</td>
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
              <th> Game </th>
              <th> Targets/G </th>
              <th> Catch/Game </th>
              <th> Yards/Game </th>
              <th> Yards/Catch </th>
              <th> Touchdowns </th>
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
