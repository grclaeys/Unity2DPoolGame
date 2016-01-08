using UnityEngine;
using System.Collections;

public class Scoreboard : MonoBehaviour {

    public UnityEngine.UI.Text outputText;
    private int score;

	void Start () {
        score = 0;
	}

    /// <summary>
    /// Changes the players score and writes it on the scoreboard
    /// </summary>
    /// <param name="deltaScore">The change in score, e.g. -1 for losing 1 point, 3 for gaining 3 points</param>
    public void UpdateScore(int deltaScore)
    {
        score += deltaScore;
        DrawScore();
    }

    private void DrawScore()
    {
        outputText.text = string.Format("Score: {0}", score);
    }
}
