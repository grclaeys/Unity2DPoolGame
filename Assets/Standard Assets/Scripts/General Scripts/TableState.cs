using UnityEngine;
using System.Collections;

public class TableState : MonoBehaviour
{
    public Scoreboard scoreboard;

    void Update()
    {
        // Exits back to main menu if escape is pressed
        if (Input.GetKeyDown(KeyCode.Escape))
            Application.LoadLevel("MainMenu");

        // Resets the pool table if space is pressed
        if (Input.GetKeyDown(KeyCode.Space))
        {
            AbstractPoolBall[] balls = FindObjectsOfType<AbstractPoolBall>();
            foreach (AbstractPoolBall ball in balls)
            {
                // for each pool ball, reduce movement to 0 and 
                // return to original orientation
                ball.GetComponent<Rigidbody2D>().velocity = new Vector2(0, 0);
                ball.GetComponent<Rigidbody2D>().angularVelocity = 0;
                ball.GetComponent<Rigidbody2D>().rotation = 0;
                ball.ResetPosition();
            }

            // Set the score to 0
            scoreboard.Reset();
        }
    }
}

