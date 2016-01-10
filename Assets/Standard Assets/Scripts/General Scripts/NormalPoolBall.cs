using UnityEngine;

public class NormalPoolBall : AbstractPoolBall
{
    protected override void OnScore()
    {
        // on score normal pool balls add 1 to the total score and
        // are removed from play
        Debug.Log(gameObject);
        gameObject.SetActive(false);

        scoreboard.UpdateScore(1);
    }
}
