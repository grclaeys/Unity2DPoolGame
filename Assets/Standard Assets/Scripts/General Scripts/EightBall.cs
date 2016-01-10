public class EightBall : AbstractPoolBall {

    public TableState tableState;

    protected override void OnScore()
    {
        // On score, if other balls still exist the eight ball
        // reduces total score by 10 and returns to its original position
        scoreboard.UpdateScore(-10);
        if (!tableState.AllNormalBallsScored())
        {
            scoreboard.UpdateScore(-10);
            ResetPosition();
        }
        // if no other balls exist, scoring the eight ball
        // wins the game
        else
        {
            tableState.Win();
        }
    }
}