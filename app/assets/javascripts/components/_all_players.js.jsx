var AllPlayers = React.createClass({
  render(){
    var players = this.props.players.map((player) => {
      return(
        // <div key={player.id}>
          <tr key={ player.id }>
            <td>{ player.position }</td>
            <td>{ player.firstName } { player.lastName }</td>
            <td>{ player.salary }</td>
            <td>{ player.fppg }</td>
            <td>{ player.played }</td>
            <td>{ player.game }</td>



            <td></td>
          </tr>
        // </div>
      )
    });

    return(
      <div>
        <table>
          <thead>
            <tr>
              <th> Position </th>
              <th> Name </th>
              <th> Salary </th>
              <th> FPPG </th>
              <th> Played </th>
              <th> Game </th>


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
