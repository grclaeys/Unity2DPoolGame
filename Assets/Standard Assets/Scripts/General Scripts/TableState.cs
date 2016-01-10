using UnityEngine;
using UnityEngine.SceneManagement;

public class TableState : MonoBehaviour
{
    public Scoreboard scoreboard;

    private AbstractPoolBall[] balls;

    void Start()
    {
        // Find all existing balls so that they can be reactivated
        // on reset
        balls = FindObjectsOfType<AbstractPoolBall>();
        Debug.Log(balls.Length);
    }


    void Update()
    {
        // Exits back to main menu if escape is pressed
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            SceneManager.LoadScene("MainMenu");
            // may need to re-enable for unity 5.2
            //Application.LoadLevel("MainMenu");
        }

        // Resets the pool table if space is pressed
        if (Input.GetKeyDown(KeyCode.Space))
        {
            foreach (AbstractPoolBall ball in balls)
            {
                // reactivate any pool balls that may have already scored
                ball.gameObject.SetActive(true);

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

    /// <summary>
    /// Switches the game to winning state where 
    /// victory messages are displayed and ball scoring is no longer
    /// updated
    /// </summary>
    public void Win()
    {
        Debug.Log("You win");
    }

    /// <returns>Returns true if all normal pool balls (not 8 or cue) have been scored</returns>
    public bool AllNormalBallsScored()
    {
        // goes through all balls
        foreach (AbstractPoolBall ball in balls)
        {
            // if the ball is a normal ball, checks to see if it is active
            if (typeof(NormalPoolBall) == ball.GetType() && ball.gameObject.activeSelf)
            {
                // if it is active, it means it has not been scored, so
                // not all normalpoolballs are scored yet
                return false;
            }
        }

        // if no non scored normal pool balls were found return true
        return true;
    }
}

