var RunningBacks = React.createClass({
  render(){
    var players = this.props.players.map((player) => {
      return(
        <tr key={ player.id }>
          <td>{ player.position }</td>
          <td>{ player.name }</td>
          <td>{ player.salary }</td>
          <td>{ player.fppg }</td>
          <td>{ player.game }</td>
          <td>{ player.touchPerGame }</td>
          <td>{ player.rushPerGame }</td>
          <td>{player.yardsPerCarry }</td>
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
              <th> Touch/Game </th>
              <th> Rush/Game </th>
              <th> Yards/Carry </th>
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
