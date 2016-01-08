using UnityEngine;

public class NormalPoolBall : AbstractPoolBall
{
    protected override void OnScore()
    {
        scoreboard.UpdateScore(1);
    }
}
