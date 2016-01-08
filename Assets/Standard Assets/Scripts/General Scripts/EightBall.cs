using UnityEngine;

public class EightBall : AbstractPoolBall {

    protected override void OnScore()
    {
        scoreboard.UpdateScore(-10);

        //Debug.Log("8 Ball Scored!");
    }
}
